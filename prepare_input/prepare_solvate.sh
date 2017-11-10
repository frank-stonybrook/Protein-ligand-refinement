### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
input=$1
while IFS= read file
do
	arr=(${file})
	name=${arr[0]}
	charge=${arr[1]| tr -d "\n"}
	echo ${charge}
	zero="0"
	rm ${name}/tleap_Na.* ${name}/tleap_Cl.* ${name}/tleap_neutral.*
	#if (( $(bc <<< "$test <= 1") ))
	if (( $(bc <<< "${charge} < 0")  ))
	then
		cp tleap_Na.in CatS_${name}
		cd CatS_${name}
		sed -i "s/ID/${name}/g" tleap_Na.in
		tleap -s -f tleap_Na.in > tleap_Na.out
		cd ../
	elif  (( $(bc <<< "${charge} > 0")  ))
	then 
		cp tleap_Cl.in CatS_${name}
                cd CatS_${name}
                sed -i "s/ID/${name}/g" tleap_Cl.in                                                                                                                                               
                tleap -s -f tleap_Cl.in > tleap_Cl.out
                cd ../
	
	else
		cp tleap_neutral.in CatS_${name}
                cd CatS_${name}
                sed -i "s/ID/${name}/g" tleap_neutral.in                                                                                                                                               
                tleap -s -f tleap_neutral.in > tleap_neutral.out
                cd ../
	fi
done<"${input}" 
