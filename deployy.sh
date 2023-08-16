#!/bin/bash

apps=["reloadng-1.0.war" "payoutlets-1.war"]

recent_file=$(find . -type f -printf '%T@ %p\n' | sort -n | tail -n 1 | cut -d' ' -f2-)



for app in "${apps[@]}"
do
	#check if the file is recent and deploy
	if [ -n "$recent_file" ]; then
	   	 echo "Recent file found: $recent_file"
	    	
	   	 # Firstly, back up the deployed files
		 cp /opt/wildfly/standalone/deployments/$recent_file ~/appsbackup/deployybk
   		
		 # then deploy
   		 cp "$recent_file" /opt/wildfly/standalone/deployments/

		 sleep 2

		 echo "Successfully deployed,Omo ope ti gbera!"
	else
	   	 echo "No recent file found in the directory!"

	    	#Check if the deployment failed then revert to backup
	   	 if [ "$?" -ne 0 ]; then
           		 echo "Deployment failed. Reverting to backup."

	   		 sleep 1
	   		 
			 cp ~/appsbackup/deployybk/$recent_file /opt/wildfly/standalone/deployments/
			 
			 echo ""
			 
			 echo "Successfully reverted!"
	   	 else
			 echo "No failed deployment, E soft!"
			 break
	   	 fi
	fi
done

echo "Weldone, Ebenezer!"
