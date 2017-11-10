###### function section ######
abs(){
	[ $1 -lt 0 ] && echo $((-$1)) || echo $1
	}
non_water_residue(){
	arr=(${1})
	name=${arr[0]}
	#abs_charge=$( abs ${arr[1]} ) ## charge shouldn't be restrainted
	last_water=$( grep "WAT" lig_com_${name}.pdb | tail -n1 |awk '{print $5}') # extract the residue number of the last water
	lig=$( grep -m1 "LIG" lig_com_${name}.pdb | awk '{print $5}') # extract the residue number of LIG
	## the restrainted residue should be :1-(${lig}-1)@CA,C,N & :(${lig}+1)-last_water@O
	#total=$(( ${abs_charge}+${rec_lig} ))
	#echo ${total}
	echo "${lig} ${last_water}"
	}
copyfile(){
	source=$1
	dest=$2
	file=$3
	cp ${source}/${file} ${dest}
	}
#################################
### directory setting ###
work_path="/cavern/frank/Dima/DDR_RUN/ToBlueWater_2"
echo "Double check!!!!!!!" ${work_path}
##### main program ##############
# This function will operate under ${name} directory #
input=$1
while IFS= read line
do
	arr=(${line})
	name=${arr[0]}
	ions=${arr[1]}
	echo $ions
	### copy necessary file ###
	source=$PWD
	dest="${work_path}/CatS_${name}"
	echo $dest
	all_file=( replace_PDBID.sh 01mi.in 02md.in 03mi.in 04mi.in 05mi.in 06md.in 08md.in 10md.in job_laufer.sh )
	for file in "${all_file[@]}" # since array isn't easy to pass to copyfile function here,we explicitly expand it and loop over all its elements.
	do
		copyfile $source $dest ${file}
	done
	cd ${dest}
	rm 07md.in 09md.in
	#lig,last_water=$( non_water_residue "${line[@]}") ## passing a arry to function use: "${array[@]}"
	lig_last_water=$( non_water_residue "${line[@]}") ## passing a arry to function use: "${array[@]}"
  	lig_last_water_arr=(${lig_last_water})
        
	protein=$(( ${lig_last_water_arr[0]}-1 ))
	lig=${lig_last_water_arr[0]}
	#water_1st=$(( ${lig_last_water_arr[0]}+1 ))
	last_water=$(( ${lig_last_water_arr[1]} + $( abs ${ions} ) ))

	echo "protein:" ${protein}
	echo "lig:" ${lig}
	echo "water_1st:" ${water_1st}
	echo "last_water:" ${last_water}
	#protein=$(( ${lig}-1 ))
  	#water_1st=$(( ${lig}+1 ))
	
	#cho $name $protein ${lig} ${water_1st} ${last_water}
	### modify min.in & minimize.sh file ###
	bash replace_PDBID.sh $name $protein ${lig} ${last_water}
	cd ${source}
done<"${input}"
