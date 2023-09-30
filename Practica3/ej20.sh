export pila=()

push(){
    if [ $# -lt 1 ]; then
        return 1
    fi

    param=$*
    pila=(${pila[*]} $param)
}

pop(){
    unset pila[${#pila[*]} - 1]
}

length(){
    echo "Longitud = ${#pila[*]}"
}

print(){
    echo ${pila[*]}
}

#programa principal
while true; do
echo "Operaciones con pila"
echo "0: Salir | 1: Push | 2: Pop | 3: Lenght | 4: print"
read opcion  

case $opcion in
"0")
	exit 1
;;
"1")
	echo "Ingrese el elemento que quiere añadir a la pila"
	read elem
	push $elem
;;
"2")
	pop
;;
"3")
	lenght
;;
"4")
	print
;;
*)
	echo "Numero no valido"
;;
esac
done