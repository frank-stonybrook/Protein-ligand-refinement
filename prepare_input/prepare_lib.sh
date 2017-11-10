### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
input=$1
work_path="/cavern/frank/Dima/Original_ligand"

while IFS= read name
do
	cp tleap_lib.in ${work_path}/CatS_${name}
	cd ${work_path}/CatS_${name}
	parmchk -i lig_${name}.mol2 -f mol2 -o lig_${name}.frcmod
	sed -i "s/ID/${name}/g" tleap_lib.in
	tleap -s -f tleap_lib.in > tleap_lib.out
	cd ${work_path}
done<"${input}"

### check results
#while IFS= read name
#do
#	cd ${work_path}/${name}
#	if ! [ -s ${name}.lib ] || !(grep -Fxq "Unit is OK." tleap_lib.out )
 #       ## ! [-s ] return False if file empty, grep return True if pattern found
#	then 
#		echo ${name}
#	fi
#	cd ${work_path}/Prepare
#done<"${input}"
