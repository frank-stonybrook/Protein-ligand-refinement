### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
input=$1
work_path="/cavern/frank/Dima/Original_ligand"
while IFS= read name
do
	cd ${work_path}/CatS_${name}
	sed -i "s/UNK/LIG/g" lig_$name.pdb lig_$name.mol2
	sed -i "s/UNL/LIG/g" lig_$name.pdb lig_$name.mol2
done<"${input}"
