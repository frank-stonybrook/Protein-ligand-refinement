PDBID=$1
sed -i "s/<PDBID>/${PDBID}/g" restart_blue.sh
#protein_residue=$2
#sed -i "s/ligand_residue/${non_water_residue}/g" 10md_restart.in
