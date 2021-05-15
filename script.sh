#!/bin/sh

set -e

PID1=$1
if [ "$PID1" != "self" ] && ! echo $PID1 | grep -q -x '[0-9]*'
then
	PID1="$(docker container inspect $PID1 | jq '.[0].State.Pid')"
fi

PID2=$3
if [ "$PID2" != "self" ] && ! echo $PID2 | grep -q -x '[0-9]*'
then
        PID2="$(docker container inspect $PID2 | jq '.[0].State.Pid')"
fi

addmount $PID1 $2 $PID2 $4
