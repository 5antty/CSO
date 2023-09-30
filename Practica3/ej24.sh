v1=(4 5 7)
v2=(1 2 3)

i=0
for elem in ${v1[*]}; do
    suma=$(expr $elem + ${v2[$i]})
    echo "La suma de los elementos de la posicion $i de los vectores es $suma"
    ((i++))
done