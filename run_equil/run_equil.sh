#!/bin/bash
dest="/cavern/frank/Dima/DDR_RUN/ToBlueWater_2"
input=$1
while IFS= read line
do
	arr=(${line})
	name=${arr[0]}
	echo ${name}
	cd ${dest}/CatS_${name}
	#bash submit.bash run_blue.sh Orig_${name} 0
	qsub job_laufer.sh
done<"${input}"
