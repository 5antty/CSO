if [ $# -lt 1 ]; then
    echo "Error, se debe ingresar por lo menos un parametro"
    exit 1
fi

array=($(cat /etc/passwd | cut -d: -f1 | grep $1))

select opt in listar eliminar contar salir; do
case $opt in
listar)
    for elem in ${array[*]}; do
        echo $elem
    done
;;
eliminar)
    i=0
    for elem in ${array[*]}; do
        echo "$i ${array[$i]}"
        ((i++))
    done
    echo "Ingrese el usuario a borrar del arreglo"
    read pos
    if [ $pos -lt ${#array[*]} ]; then
        unset array[$pos]
    fi
    #echo "borrar"
;;
contar)
    echo "La cantidad de elementos en el arreglo es ${#array[*]}"
;;
salir)
    break
;;
esac
done