#!/bin/bash

PRG=pms

if [ $# -lt 1 ];then 
  echo "Usage: sh test.sh number"
  exit 1
else
  num=$1
  # get number of process needed: log_2(num)+1
  float=`echo "l($1)/l(2)+1" | bc -l`
  cpu=`echo "($float+0.5)/1" | bc`

#  echo "num: $num"
#  echo "cpu: $cpu"
#  echo "----------------------"
fi;

dd if=/dev/random bs=1 count=$num of=numbers &> /dev/null

#mpicc -std=gnu99 -lm --prefix /usr/local/share/OpenMPI -o $PRG $PRG.c && mpirun --prefix /usr/local/share/OpenMPI -np $cpu $PRG -m
#mpicc -std=gnu99 -lm -g -DDEBUG --prefix /usr/local/share/OpenMPI -o $PRG $PRG.c && mpirun --prefix /usr/local/share/OpenMPI -np $cpu $PRG -m
mpicc -lm -g -std=gnu99 -DDEBUG --prefix /usr/local/share/OpenMPI -o $PRG $PRG.c && mpirun --prefix /usr/local/share/OpenMPI -np $cpu $PRG

#rm -f $PRG numbers
