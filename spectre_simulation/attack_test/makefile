TARGET_ISA=x86

GEM5_HOME=$(realpath ../)
$(info   GEM5_HOME is $(GEM5_HOME))

CXX=gcc

CFLAGS=-I$(GEM5_HOME)/include

LDFLAGS=-L$(GEM5_HOME)/util/m5/build/$(TARGET_ISA)/out -lm5

OBJECTS= test

all: test

test:
	$(CXX) -static -g -o $(OBJECTS) m5_mmap.c test.c  $(CFLAGS) $(LDFLAGS)

clean:
	rm -f $(OBJECTS)
