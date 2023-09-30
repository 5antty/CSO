inicializar(){
    array=()
}

agregar_elem(){
    array=(${array[*]} $1)
}

eliminar_elem(){
    if [ $1 -lt ${#array[*]} ];then
        unset array[$1]
    else
        echo "El parametro ingresado no es una posicion del arreglo"
    fi
}

longitud(){
    echo "La longitud del arreglo es ${#array[*]}"
}

imprimir(){
    echo ${array[*]}
}

inicializarConValores(){
    local long=$1
    local val=$2
    array=()
    for (( i=0 ; i < long ; i++)); do
        array[$i]=$val
    done
}

inicializar

agregar_elem 1
agregar_elem hola
agregar_elem jojo
imprimir
eliminar_elem 5
eliminar_elem 2
imprimir
inicializarConValores 5 4
imprimir