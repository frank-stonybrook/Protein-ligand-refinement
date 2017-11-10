### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
input=$1
work_path="/cavern/frank/Dima/Original_ligand"
while IFS= read name
do
	cd ${work_path}/CatS_${name}
	sed -i "s/HOH/WAT/g" rec.pdb
	sed -i "s/OW/O /g" rec.pdb
	sed -i "/CONECT/d" rec.pdb
done<"${input}"
