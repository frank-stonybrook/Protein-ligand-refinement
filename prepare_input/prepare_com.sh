### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
input=$1
work_path="/cavern/frank/Dima/Original_ligand"
while IFS= read name
do
	cp tleap_com.in ${work_path}/CatS_${name}
	cd ${work_path}/CatS_${name}
	sed -i "s/ID/${name}/g" tleap_com.in
	tleap -s -f tleap_com.in > tleap_com.out
	cd ${work_path}
done<"${input}"
