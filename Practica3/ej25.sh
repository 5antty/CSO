users=($(cat /etc/group | grep berserkers | cut -d: -f4 | tr ',' ' '))

if [ $# -lt 1 ]; then
    echo "Ingrese al menos un parametro"
    exit
fi
case $1 in
"-b")
    if [ $2 -lt ${#users[*]} ]; then
        echo ${users[$2]}
    else
        echo "el numero ingresado no es una posicion del arreglo"
    fi
;;
"-l")
    echo "La longitud del arreglo es ${#users[*]}"
;;
"-i")
    echo ${users[*]}
;;
esac
