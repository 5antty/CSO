if [ $# -lt 1 ]; then
    echo "Se necesita por lo menos un parametro"
    exit
fi
i=0
files=0
dir=0
for arch in $*; do
    if [ $(expr $i % 2) -ne 0 ]; then
        if [ -e $arch ]; then
            if [ -f $arch ]; then
                echo "$arch es un archivo"
                ((files++))
            elif [ -d $arch ]; then
                echo "$arch es un directorio"
                ((dir++))
            fi
        fi
    fi
    ((i++))
done

echo "La cantidad de archivos son $files"
echo "La cantidad de directorios son $dir"