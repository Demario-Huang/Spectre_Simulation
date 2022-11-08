# Spectre simulation for term project 

### overview

**Simulation tool:** gem5

**Simulation goal:** using gem5 build a simple system and simulate the spectre V1 attack on that system, also using some simple mitigation such as applying complier option to visulize the effect. 

**Simluation tasks:** 

- build a gem5 simple system (contains Out-of-Order execution CPU, three level cache )
- Train the branch predictor (it might be tough, I will try it later)
- create the attack code (should be easy to visualize)
- Running the code on the system we created, and visualize the attack result.
- Try different mitigation methods and see their effects

**Simulation time:** Three weeks

### Learning gem5

- To set up gem5 environment, check the official website: 

https://www.gem5.org/documentation/learning_gem5/part1/building/

it contains how to setup the developing environment and build the first simple gem5 system. 

- Since we should use the **Simple Mode** to demonstrate our idea (Full System mode is not necessary), you only need to go through this part:

https://www.gem5.org/documentation/learning_gem5/part1/simple_config/

https://www.gem5.org/documentation/learning_gem5/part1/gem5_stats/

It shows the how to add the cache in the simple system, and also how to understand the statistics for our system (it is essential **since we need to see the effect on the cache**)

By so far, we can use python to create a very simple system, which is enough for us to run the spectre attack.

- How to write a attacking code

This might be a little tricky. since in this part, we have to fully understand which data will be replaced into cache and how to get the secret data using brach predictor. there are several Spectre POC code for us to reference. However, our code is running on true system, it might be different from POC code. The logic should be the same. 

https://github.com/Eugnis/spectre-attack

https://github.com/crozone/SpectrePoC

- mitigation methods:

Invisispec already have the gem5 code:

https://github.com/mjyan0720/InvisiSpec-1.0

we can also use some `lfence ` in complier option to demonstrate it can mitigate spectre attack, this part might not to so hard. 

- Additional resources for learning gem5

  Gem5 memory system: https://www.gem5.org/documentation/general_docs/memory_system/

  Wisconsin gem5 learning website: https://pages.cs.wisc.edu/~markhill/cs757/Spring2016/learning_gem5/index.html#

