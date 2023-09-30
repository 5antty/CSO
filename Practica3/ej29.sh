array=()
for elem in /home/*.doc; do
    array=(${array[*]} $elem)
done

verArchivo(){
    local nombre=$1
    for elem in ${array[*]}; do
        nomArch=$(basename $elem)
        if [ "$nomArch" == "$nombre" ]; then
            cat $elem
            return 0
        fi
    done
    echo "Archivo no encontrado"
    return 5
}

cantidadArchivos(){
    echo "La cantidad de archivos .doc que hay en /home es ${#array[*]}"
}

borrarArchivo(){
    local nombre=$1
    echo "Quiere eliminar el archivo logicamente?"
    select opt in Si No Salir; do
    case $opt in
    Si)
        local i=0
        #if [ -e /home/$nombre ]; then

        for elem in ${array[*]}; do
            nomArch=$(basename $elem)
            if [[ "$nomArch" == "$nombre" ]]; then
                unset array[$i]
                return 0
            fi
            ((i++))
        done
        echo "Archivo no encontrado"
        return 10
    ;;
    No)
        local i=0
        #if [ -e /home/$nombre ]; then

        for elem in ${array[*]}; do
            nomArch=$(basename $elem)
            if [[ "$nomArch" == "$nombre" ]]; then
                unset array[$i]
                rm $elem
                return 0
            fi
            ((i++))
        done
        echo "Archivo no encontrado"
        return 10
    ;;
    Salir)
        break
    ;;
    esac
    done
}

#for elem in ${array[*]}; do
#    echo $(basename $elem)
#done

#Testeo de funciones
verArchivo $1
cantidadArchivos
borrarArchivo $1
cantidadArchivos
