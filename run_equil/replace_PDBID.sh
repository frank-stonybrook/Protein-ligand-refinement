ID=$1
sed -i "s/<ID>/${ID}/g" job_laufer.sh

protein_residue=$2
ligand_residue=$3
last_water=$4

sed -i "s/last_water/${last_water}/g"            01mi.in 02md.in 03mi.in 04mi.in 05mi.in 06md.in 08md.in 10md.in
 
sed -i "s/ligand_residue/${ligand_residue}/g"         06md.in 08md.in 10md.in

sed -i "s/protein_residue/${protein_residue}/g"  06md.in 08md.in 10md.in


