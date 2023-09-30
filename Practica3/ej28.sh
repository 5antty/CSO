if [ $# -lt 1 ]; then
    echo "Se debe ingresar al menos un parametro"
    exit 1
fi

dir=$1
if [ ! -e $dir ]; then
    echo "El directorio $dir no existe"
    exit 4
fi

lect=0
esc=0
for elem in $(ls $dir); do
    if [ -r $elem ]; then
        ((lect++))
    fi
    if [ -w $elem ]; then
        ((esc++))
    fi
done

echo "La cantidad de archivos con permisos de escritura es $esc"
echo "La cantidad de archivos con permisos de lectura es $lect"