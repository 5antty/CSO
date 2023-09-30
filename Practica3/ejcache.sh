#!bin/bash

if [ ! -d $1 ]; then
	echo "La ruta $1 es invalida"
	exit 1
fi
echo "inicializandp eñ arreglo"
files=()

for filename in $(ls $1)
do
	files+=($filename)
done

mem_grep(){
    echo "INgrese el patron"
    read pattern
	for f in ${files[*]}
	do
		match = $( grep $pattern $f | wc -l)
	done
mem_ls(){
    echo "${files[*]}" #esto sirve para imprimir todos los elementos de un arreglo
}

echo "cache inicializada OK! ${files[@]}"

select op in ls exit
do
    case $op in
		ls) mem_ls;;
		exit) exit;;
		*) echo "OPcion invalida";;
    esac
done
