if [ $# -lt 2 ]; then
    echo "Se debe ingresar por lo menos un directorio y uno o mas nombres de archivos"
    exit
fi

dir=$1
if [ -e $dir ] && [ -d $dir ]; then
    array=($*)
    for ((i=1 ; i < $# ; i++)); do
        if [ -e $dir${array[$i]} ]; then
            if [ -f $dir${array[$i]} ]; then
                if [ -x $dir${array[$i]} ]; then
                    echo "El archivo ${array[$i]} tiene permisos de ejecucion"
                fi
            elif [ -d $dir${array[$i]} ]; then
                if [ -w $dir${array[$i]} ]; then
                    echo "El directorio ${array[$i]} tiene permisos de escritura"
                fi
            fi
        fi
    done
fi