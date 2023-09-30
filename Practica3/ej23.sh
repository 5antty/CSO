v=(1 2 3 4 5 6 7)

i=0
imp=0
for elem in ${v[*]}; do
    if [ $(expr $i % 2) -ne 0 ]; then
        echo $elem
    else
        ((imp++))
    fi
    ((i++))
done

echo "La cantidad de elementos impares es $imp"