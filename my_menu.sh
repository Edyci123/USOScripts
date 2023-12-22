#!/bin/bash

while :
do
	echo "Cu ce vrei sa lucrezi?"
	echo "1. Fisiere"
	echo "2. Directoare"
	echo "3. Iesire"
	read -p "Alege: " operation
	case $operation in
		1)
		echo "Care este numele fiserului? (cale absoluta)"
		read -p "Nume fiser: " path
		echo "Ce operatie vrei sa faci?"
done
