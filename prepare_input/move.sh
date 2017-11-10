input=$1
dest="/cavern/frank/Dima/Original_ligand"
while IFS= read line
do
	#mkdir $dest/ToBlueWater_3/CatS_${line}
	#cp $dest/CatS_${line}/lig_com_${line}.pdb $dest/ToBlueWater_3/CatS_${line}
	#cp $dest/CatS_${line}/lig_${line}.{inpcrd,prmtop} $dest/ToBlueWater_3/CatS_${line}
	mkdir $dest/INITIAL
	cp $dest/CatS_${line}/lig_com_${line}.pdb $dest/INITIAL
done<"${input}"
