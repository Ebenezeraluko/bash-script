#!/bin/bash

apps=("reloadBackend.war" "reloadng-1.0.war" "Napi-2.0.war" "payoutlets-1.war" "fastr-1.0.war")

for app in "${apps[@]}"
do
    mv ~/Downloads/$app ./apps

    if [ $? -eq 0 ]; then
        echo "Successfully moved $app"
    else
        echo "Failed to move $app. Mafo, try again!"
    fi

done

echo ""
echo ".........................."
echo ""
echo "Send to the server, Gbera!"

sleep 1

scp -i mindcomsys1.pem ~/Downloads/Blacksilicon/Keys/${apps[0]} ec2-user@34.211.160.25:~

sleep 1

scp -i mindcomsys1.pem ~/Downloads/Blacksilicon/Keys/${apps[1]} ec2-user@34.211.160.25:~

sleep 1

scp -i netapps2.pem ~/Downloads/Blacksilicon/Keys/${apps[2]} ec2-user@52.10.60.175:~

sleep 1

scp -i mindcomsys1.pem ~/Downloads/Blacksilicon/Keys/${apps[3]} ec2-user@34.211.160.25:~

sleep 1

scp -i mindcomsys1.pem ~/Downloads/Blacksilicon/Keys/${apps[4]} ec2-user@34.211.160.25:~

echo ""
echo "Weldone, Ebenezer!"

