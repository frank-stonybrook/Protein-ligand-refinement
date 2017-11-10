### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
charge=$1
while IFS= read PDBID_Charge
do
        arr=(${PDBID_Charge})
        name=${arr[0]}
        charge=${arr[1]}
        echo ${arr[0]}
        echo ${arr[1]}
        cp charge.sh CatS_${name}
        cp prepare_charge.sh CatS_${name}
        cd CatS_${name}
        bash prepare_charge.sh $name $charge
        qsub charge.sh
        cd ../
done<"${charge}"

