### Original Copyrights@CongLiu(cong.liu.1@stonybrook.edu). Feel free to change or distribute. ###
sysID=$1
NetCharge=$2
sed -i "s/ID/${sysID}/g" charge.sh
sed -i "s/job_name/${sysID}/g" charge.sh
sed -i "s/net_charge/${NetCharge}/g" charge.sh

