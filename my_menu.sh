#!/bin/bash

while :
do
	echo "Cu ce vrei sa lucrezi?"
	echo "1. Fisiere"
	echo "2. Directoare"
	read -p "Alege: " operation
	case $operation in
		1)
		echo "Care este numele fiserului? (cale absoluta)"
		read -p "Nume fisier: " path
		if [ ! -f "$path" ]; then
			echo "Fisierul $path nu exista"
			continue;
		fi
		echo "Ce operatie vrei sa faci?"
		echo "1. Deschidere"
		echo "2. Stergere"
		echo "3. Mutare/Redenumire"
		echo "4. Modificare permisiuni"
		echo "5. Verificare permisiuni"
		read -p "Alege: " fileOperation
		
		case $fileOperation in
			1) cat $path;;
			2) rm $path;;
			3) 
			echo "Care este destinatia? (cale absoluta)"
			read -p "Nume destinatie: " pathDest
			mv $path $pathDest;;
			4) echo "Ce permisiun ai vrea sa pui la fisier? (ex: 754 pentru rwxr-xr--)"
			read -p "Permisiuni: " perms
			chmod $perms $path;;
			5) echo "Ce permisiuni ai vrea sa verifici?"
			perms=$(stat -L -c "%a" $path)
			echo "$perms";;
		esac
		;;
		2)
		echo "Care este numele directorului? (cale absoluta)"
		read -p "Nume director: " path
		if [ ! -d "$path" ]; then
			echo "Directorul $path nu exista"
			continue;
		fi
		echo "Ce operatie vrei sa faci?"
		echo "1. Afisare continut"
		echo "2. Stergere"
		echo "3. Mutare/Redenumire"
		echo "4. Modificare permisiuni"
		echo "5. Verificare permisiuni"
		read -p "Alege: " folderOperation
		case $folderOperation in
			1) ls -a $path;;
			2) rm -rf $path;;
			3) 
			echo "Care este destinatia? (cale absoluta)"
			read -p "Nume destinatie: " pathDest
			mv $path $pathDest;;
			4) echo "Ce permisiun ai vrea sa pui la director? (ex: 754 pentru rwxr-xr--)"
			read -p "Permisiuni: " perms
			chmod $perms $path;;
			5) echo "Ce permisiuni ai vrea sa verifici?"
			perms=$(stat -L -c "%a" $path)
			echo "$perms";;
		esac
		;;

	esac

done