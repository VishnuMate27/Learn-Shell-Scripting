#!/bin/bash

<< disclaimer
This is just for infotainment purpose
disclaimer

read -p "Jetha ne mudke kisko dekha: " bandi

read -p "Jetha ka pyar %" pyaar

if [[ $bandi == "daya bhabhi" ]];
then
	echo "Jetha is loyal"
elif [[ $pyaar -ge 100  ]];
then	
	echo "jetha is loyal" 
else
	echo "Jetha is not loyal"
fi	
