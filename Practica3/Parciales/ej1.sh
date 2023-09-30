#/var/log/municipios.txt
MUNICIPIOS=$(cat /home/hola.doc | cut -d' ' -f1)
echo ${MUNICIPIOS[*]}

existeMunicipio(){
    local nombre=$1
    for elem in ${MUNICIPIOS[*]}; do
        if [ "$elem" == "$nombre" ]; then
            echo "Se encontro el elemento"
            return 0
        fi
    done
    return 1
} 

agregarMunicipio(){
    local nombre=$1
    if [ $# -lt 1 ]; then
        echo "Error, no se ingreso un nombre"
        return 5
    fi
    existeMunicipio $nombre
    if [ $? -ne 0 ]; then
        MUNICIPIOS=(${MUNICIPIOS[*]} $nombre)
    fi
}

listar(){
    echo ${MUNICIPIOS[*]}
}

cantidadMunicipios(){
    echo ${#MUNICIPIOS[*]}
}
