### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
input=$1
work_path="/cavern/frank/Dima/Original_ligand"
while IFS= read file
do
	cd ${work_path}/CatS_${file}
	ligand_charge=$(grep -m2 "Total unperturbed charge" tleap_com.out|tail -n1 |awk -F ":" '{printf "%1.f",$2}')
	complex_charge=$(grep -m1 "Total unperturbed charge" tleap_com.out|awk -F ":" '{printf "%1.f",$2}')
	echo ${file} $ligand_charge >> ../ligand_net_charge.txt
	echo ${file} $complex_charge >> ../complex_net_charge.txt
done<"${input}"
