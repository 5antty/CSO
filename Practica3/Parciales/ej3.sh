if [ $# -lt 2 ]; then
    echo "Se necesitan 2 o mas argumentos"
    exit 1
fi
#arch=/var/log/access.$1.log
arch=/home/sxnty/bal.doc
if [ ! -e ${arch} ]; then
    echo "Error, no existe el archivo"
    exit 2
fi
ips=($*)
for ((i=1; i < $# ; i++)); do
    echo "${ips[$i]} | $(cat $arch | grep ${ips[$i]} | cut -d' ' -f1 | wc -l)"
done