import m5
from m5.objects import *

class L1Cache(Cache):
  """Simple L1 Cache with default values"""
  assoc = 2
  tag_latency = 2
  data_latency = 2
  response_latency = 2
  mshrs = 4
  tgts_per_mshr = 20

  def connectBus(self, bus):
    """Connect this cache to a memory-side bus"""
    self.mem_side = bus.cpu_side_ports
  def connectCPU(self, cpu):
    """Connect this cache's port to a CPU-side port
        This must be defined in a subclass"""
    raise NotImplementedError

class L1ICache(L1Cache):
  """Simple L1 instruction cache with default values"""
  # Set the default size
  size = '16kB'
  
  def connectCPU(self, cpu):
    """Connect this cache's port to a CPU icache port"""
    self.cpu_side = cpu.icache_port

class L1DCache(L1Cache):
  size = '64kB'

  def connectCPU(self, cpu):
    self.cpu_side = cpu.dcache_port


class L2Cache(Cache):
  size = '256kB'
  assoc = 8
  tag_latency = 20
  data_latency = 20
  response_latency = 20
  mshrs = 20
  tgts_per_mshr = 12

  def connectCPUSideBus(self, bus):
    self.cpu_side = bus.mem_side_ports

  def connectMemSideBus(self, bus):
    self.mem_side = bus.cpu_side_ports



# initial the system
system = System()

# define the system arg
system.clk_domain = SrcClockDomain()
system.clk_domain.clock = '1GHz'
system.clk_domain.voltage_domain = VoltageDomain()

# intial the memory
system.mem_mode = 'timing'
system.mem_ranges = [AddrRange('512MB')]

# initial the cpu
system.cpu = TimingSimpleCPU()

# define the cache
system.cpu.icache = L1ICache()
system.cpu.dcache = L1DCache()

system.cpu.icache.connectCPU(system.cpu)
system.cpu.dcache.connectCPU(system.cpu)

# memory bus
system.membus = SystemXBar()

# L2 cache bus
system.l2bus = L2XBar()

system.cpu.icache.connectBus(system.l2bus)
system.cpu.dcache.connectBus(system.l2bus)

system.l2cache = L2Cache()
system.l2cache.connectCPUSideBus(system.l2bus)
system.membus = SystemXBar()
system.l2cache.connectMemSideBus(system.membus)

system.cpu.createInterruptController()
system.cpu.interrupts[0].pio = system.membus.mem_side_ports
system.cpu.interrupts[0].int_requestor = system.membus.cpu_side_ports
system.cpu.interrupts[0].int_responder = system.membus.mem_side_ports

system.system_port = system.membus.cpu_side_ports

system.mem_ctrl = MemCtrl()
system.mem_ctrl.dram = DDR3_1600_8x8()
system.mem_ctrl.dram.range = system.mem_ranges[0]
system.mem_ctrl.port = system.membus.mem_side_ports


binary = 'spectre_simulation/test'

# for gem5 V21 and beyond
system.workload = SEWorkload.init_compatible(binary)

process = Process()
process.cmd = [binary]
system.cpu.workload = process
system.cpu.createThreads()

root = Root(full_system = False, system = system)
m5.instantiate()

print("Beginning simulation!")
exit_event = m5.simulate()

print('Exiting @ tick {} because {}'
      .format(m5.curTick(), exit_event.getCause()))