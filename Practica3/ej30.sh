archivos=()

for elem in $(ls); do
    if [ -x $elem ]; then
        archivos=(${archivos[*]} $elem)
    fi
done

ruta=/home/$(whoami)/bin

if [ ! -e $ruta ]; then
    mkdir $ruta
    echo "Se creo el directorio $ruta"
fi

cant=0
for elem in ${archivos[*]}; do
    mv $elem $ruta
    echo "$elem movido"
    ((cant++))
done

if [ $cant -eq 0 ]; then
    echo "No se movio ningun archivo"
else 
    echo "La cantidad de archivos movidos es $cant"
fi