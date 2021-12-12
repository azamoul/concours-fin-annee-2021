#! /bin/bash
# set -x

function gettingWinner() {
    product=$1
    file=$2

    echo
    echo
    echo Selection du gagnant du $product
    nb_lines=`cat $file | wc -l`
    nb_random=$((RANDOM%$nb_lines))
    nom_gagnant=`sed "${nb_random}q;d" $file`
    echo =========================================================================
    echo "========================== Bravo à:  $nom_gagnant"
    echo =========================================================================
    sed -i "/$nom_gagnant/d" $file
    sleep 2
}

echo
echo =============================================
echo === Résultats du concours AZAMOUL.
echo =============================================
echo
sleep 1
[ $# -eq 0 ] && echo "Veuillez fournir un fichier contenant la liste des participants, s'il vous plait." && exit 1

[ ! -f $1 ] && echo "Veuillez fournir un fichier contenant la liste des participants, s'il vous plait." && exit 1

file=$1
res_file=randomizedList.txt

echo
sleep 1
echo On commence par mélanger la liste des participants...
cat $file | shuf > $res_file
sleep 1
echo =============================================
echo La liste a bien été mélangée...
cat $res_file
sleep 2
echo
echo =============================================
clear

declare -a arr=("tableau touareg" "tableau afzim" "sweat azamoul" "pull yaz" "tshirt personnalisé" "coque abstract amazigh")

for i in "${arr[@]}"
do
   gettingWinner "$i" $res_file
done

exit 0