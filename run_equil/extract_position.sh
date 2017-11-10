input=$1
work_path="/scratch/sciteam/liu6/Dima/Original/ToBlueWater_2"
while IFS= read line
do
cd ${work_path}/CatS_${line}
sed -n "/%FLAG RESIDUE_LABEL/,/Cl- WAT/p" *.prmtop|sed '1,2d'  > residue.txt
done <"${input}"
