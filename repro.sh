#!/bin/bash

# Make pushd and popd silent
pushd () {
    command pushd "$@" > /dev/null
}
popd () {
    command popd "$@" > /dev/null
}
export pushd popd

### Compile ISA-L
echo "======================================="
echo "Compiling ISA-L."
pushd $PAVISE_ROOT/isa-l
./autogen.sh &> /dev/null
./configure --prefix=$PAVISE_ROOT/isa-l --libdir=$PAVISE_ROOT/isa-l/lib &> /dev/null
make &> /dev/null
make install &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! ISA-L build failed." 
    exit 1
fi
echo "ISA-L compilation finished successfully."
popd 

### Compile Pavise shared library
echo "======================================="
echo "Compiling Pavise shared library."
pushd $PAVISE_ROOT
make a_runtime_eval &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! Pavise build failed." 
    exit 1
fi
echo "Pavise compilation finished successfully."
popd 

### Preproduce Pavise ignore list results
echo "======================================="
echo "Preproducing Pavise ignore list results"
# Edit PMDK user.mk to use Pavise ignore lsit pass
printf "CC=clang 
CXX=clang++
EXTRA_CFLAGS = -g -Wno-error -fexperimental-new-pass-manager -pavise=pavisenoload" > $PAVISE_ROOT/pmdk-1.10/user.mk
### Recompile PMDK with new pass
echo "Recompiling PMDK with new pass... (~3 min)"
pushd $PAVISE_ROOT/pmdk-1.10
make clean -j &> /dev/null
make -j &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1
fi
echo "PMDK compilation finished successfully."
popd 
### Run microbenchmarks
echo "Running microbenchmarks with ignore list"
pushd $PAVISE_ROOT/pmdk-1.10/src/benchmarks
source pact22_repro_microbench_ignorelist.sh
popd


### Preproduce Pavise conservative results
echo "============================================="
echo "Preproducing Pavise conservative list results"
# Edit PMDK user.mk to use Pavise conservative tracking pass
printf "CC=clang
CXX=clang++
EXTRA_CFLAGS = -g -Wno-error -fexperimental-new-pass-manager -pavise=pavisenoload_conservative" > $PAVISE_ROOT/pmdk-1.10/user.mk
# Modify LD_LIBRARY_PATH 
export LD_LIBRARY_PATH=$PAVISE_ROOT/pmdk-1.10/src/nondebug:$PAVISE_ROOT/build/lib:$PAVISE_ROOT/isa-l/lib:$PAVISE_ROOT/pmdk-1.10-no_pavise/src/examples/libpmemobj/hashmap:/usr/local/lib64:/usr/local/lib:/usr/lib/x86_64-linux-gnu
### Recompile PMDK with new pass
echo "Recompiling PMDK with new pass... (~3 min)"
pushd $PAVISE_ROOT/pmdk-1.10
make clean -j &> /dev/null
make -j &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1
fi
echo "Pavise compilation finished successfully."
popd 
### Run microbenchmarks
echo "Running microbenchmarks with conservative tracking"
pushd $PAVISE_ROOT/pmdk-1.10/src/benchmarks
source pact22_repro_microbench_conservative.sh
popd


### Preproduce PMDK without Pavise results
echo "============================================="
echo "Preproducing Pavise conservative list results"
# Edit PMDK user.mk to use Pavise conservative tracking pass
printf "CC=clang
CXX=clang++
EXTRA_CFLAGS = -g -Wno-error -fexperimental-new-pass-manager" > $PAVISE_ROOT/pmdk-1.10-no_pavise/user.mk
# Modify LD_LIBRARY_PATH to use PMDK without Pavise
export LD_LIBRARY_PATH=$PAVISE_ROOT/pmdk-1.10-no_pavise/src/nondebug:$PAVISE_ROOT/build/lib:$PAVISE_ROOT/isa-l/lib:$PAVISE_ROOT/pmdk-1.10-no_pavise/src/examples/libpmemobj/hashmap:/usr/local/lib64:/usr/local/lib:/usr/lib/x86_64-linux-gnu
### Recompile PMDK with new pass
echo "Recompiling PMDK with new pass... (~3 min)" 
pushd $PAVISE_ROOT/pmdk-1.10-no_pavise
make clean -j &> /dev/null
make -j &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1
fi
echo "Pavise compilation finished successfully."
popd 
### Run microbenchmarks
echo "Running microbenchmarks with conservative tracking"
pushd $PAVISE_ROOT/pmdk-1.10-no_pavise/src/benchmarks
source pact22_repro_microbench_pmdk.sh
popd

echo "\n"
echo "Finished reproducing microbenchmarks. Results are stored in $PAVISE_ROOT/results"
echo "Reproducing real applications in 3 seconds..."
sleep 3

###################################################
# Real applications
###################################################
### Preproduce vacation  + Pavise ignore list
echo "======================================="
echo "Preproducing vacation + Pavise ignore list"
# Edit PMDK user.mk to use Pavise ignorelist pass
printf "CC=clang 
CXX=clang++
EXTRA_CFLAGS = -g -Wno-error -fexperimental-new-pass-manager -pavise=pavisenoload" > $PAVISE_ROOT/pmdk-1.10/user.mk
### Recompile PMDK with new pass
echo "Recompiling PMDK with new pass... (~3 min)"
pushd $PAVISE_ROOT/pmdk-1.10
make clean -j &> /dev/null
make -j &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1
fi
echo "PMDK compilation finished successfully."
popd 
### Build vacation PMDK (WHISPER)
echo "Recompiling vacation PMDK..."
pushd $PAVISE_ROOT/apps/mod-pavise/pmdk
bash compile.sh &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1
fi
echo "PMDK compilation finished successfully."
popd
### Build pmem-valgrind
echo "Recompiling pmem-valgrind..."
pushd $PAVISE_ROOT/apps/mod-pavise/pmem-valgrind
./autogen.sh &> /dev/null
./configure &> /dev/null
make -j &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1

echo "pmem-valgrind compilation finished successfully."
popd
### Build vacation
echo "Building vacation..."
pushd $PAVISE_ROOT/apps/mod-pavise/vacation-pmdk
# Use Pavise ignore list pass
sed -i 's@set(CMAKE_CXX_FLAGS.*@set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb -O2 -mclwb -Wno-error=unused-command-line-argument -fexperimental-new-pass-manager -pavise=pavisenoload")@' ./CMakeLists.txt
bash compile.sh  &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! vacaction build failed." 
    exit 1
fi
echo "vacation compilation finished successfully."
popd
### Run vacation
echo "Running vacation with ignore list"
pushd $PAVISE_ROOT/apps/mod-pavise/vacation-pmdk/build
rm -rf /pmem0p1/kevin/pools/*
./vacation /pmem0p1/kevin/pools/vacation -r100000 -t200000 -n1 -q55 -u99 &> $PAVISE_ROOT/results/vacation_ignorelist
echo "Finished running vacation."
popd

###################################################
# Preproduce vacation  + Pavise conservative
###################################################
echo "======================================="
echo "Preproducing vacation + Pavise conservative tracking"
# Edit PMDK user.mk to use Pavise conservative
printf "CC=clang 
CXX=clang++
EXTRA_CFLAGS = -g -Wno-error -fexperimental-new-pass-manager -pavise=pavisenoload_conservative" > $PAVISE_ROOT/pmdk-1.10/user.mk
# Modify LD_LIBRARY_PATH 
export LD_LIBRARY_PATH=$PAVISE_ROOT/pmdk-1.10/src/nondebug:$PAVISE_ROOT/build/lib:$PAVISE_ROOT/isa-l/lib:$PAVISE_ROOT/pmdk-1.10/src/examples/libpmemobj/hashmap:/usr/local/lib64:/usr/local/lib:/usr/lib/x86_64-linux-gnu
### Recompile PMDK with new pass
echo "Recompiling PMDK with new pass... (~3 min)"
pushd $PAVISE_ROOT/pmdk-1.10
make clean -j &> /dev/null
make -j &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1
fi
echo "PMDK compilation finished successfully."
popd 
### Build vacation PMDK (WHISPER)
echo "Recompiling vacation PMDK..."
pushd $PAVISE_ROOT/apps/mod-pavise/pmdk
bash compile.sh &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1
fi
echo "PMDK compilation finished successfully."
popd
### Build pmem-valgrind
echo "Recompiling pmem-valgrind..."
pushd $PAVISE_ROOT/apps/mod-pavise/pmem-valgrind
./autogen.sh &> /dev/null
./configure &> /dev/null
make -j &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! PMDK build failed." 
    exit 1
fi
echo "pmem-valgrind compilation finished successfully."
popd
### Build vacation
echo "Building vacation..."
pushd $PAVISE_ROOT/apps/mod-pavise/vacation-pmdk
sed -i 's@set(CMAKE_CXX_FLAGS.*@set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb -O2 -mclwb -Wno-error=unused-command-line-argument -fexperimental-new-pass-manager -pavise=pavisenoload_conservative")@' ./CMakeLists.txt
bash compile.sh  &> /dev/null
if [ $? -ne 0 ]; 
then 
    echo "ERROR! vacaction build failed." 
    exit 1
fi
echo "vacation compilation finished successfully."
popd
### Run vacation
echo "Running vacation with conservative"
pushd $PAVISE_ROOT/apps/mod-pavise/vacation-pmdk/build
rm -rf /pmem0p1/kevin/pools/*
./vacation /pmem0p1/kevin/pools/vacation -r100000 -t200000 -n1 -q55 -u99 &> $PAVISE_ROOT/results/vacation_conservative
echo "Finished running vacation."
popd
