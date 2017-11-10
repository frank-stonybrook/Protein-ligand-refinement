input=$1
while IFS= read line
do
	mkdir CatS_${line}
done<"${input}"
