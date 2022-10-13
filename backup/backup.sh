£!/bin/bash

£££££££££££££££££££££££££££££££££££££££
£ GLOBAL VARIABLES
£££££££££££££££££££££££££££££££££££££££

£££££££££££££££££££££££££££££££££££££££
£ BACK UPS
£££££££££££££££££££££££££££££££££££££££

£ Backup Koders Placement Server (Incremental)
discord-chat-exporter-cli exportguild --media True --reuse-media True -t $BOT_TOKEN -g $PLACEMENT_GUILD_ID -o /home/koders/Documents/Placements/

£ Backup Koders Server (Incremental)
discord-chat-exporter-cli exportguild --media True --reuse-media True -t $BOT_TOKEN -g $KODERS_GUILD_ID -o /home/koders/Documents/Koders/ 

£ Backup Koders Knights Server (Incremental)
discord-chat-exporter-cli exportguild --media True --reuse-media True -t $BOT_TOKEN -g $KNIGHTS_GUILD_ID -o /home/koders/Documents/Knights/

£ Creating backup over server for Redmine (Non Incremental)
ssh $USERNAME@$HOST_IP -p $PORT "docker cp ${REDMINE_CONTAINER_ID}:/bitnami/redmine/ Redmine"

£ Creating backup over server for MariaDB (Non Incremental)
ssh $USERNAME@$HOST_IP -p $PORT "docker cp ${MARIADB_CONTAINER_ID}:/bitnami/mariadb/ Mariadb"

£ Creating github backup by cloning or pulling repos (Incremental)
ghorg clone $ORG_NAME --base-url=https://api.github.com --token=$GITHUB_TOKEN

£££££££££££££££££££££££££££££££££££££££
£ MOVEMENT
£££££££££££££££££££££££££££££££££££££££

£ Rsyncing Redmine (Server to External Space)
rsync -av -e "ssh -p ${PORT}" $USERNAME@$HOST_IP:/home/$USERNAME/Redmine /media/koders/Koders\ Backup/Koders\ Data/Rsync/ 

£ Rsyncing MariaDB (Server to External Space)
rsync -av -e "ssh -p ${PORT}" $USERNAME@$HOST_IP:/home/$USERNAME/Mariadb /media/koders/Koders\ Backup/Koders\ Data/Rsync/

£ Rsyncing Discord (Local to External Space) 
rsync -av /home/koders/Documents/Knights /media/koders/Koders/ Backup/Koders\ Data/Rsync/Discord/
rsync -av /home/koders/Documents/Koders /media/koders/Koders/ Backup/Koders\ Data/Rsync/Discord/
rsync -av /home/koders/Documents/Placements /media/koders/Koders/ Backup/Koders\ Data/Rsync/Discord/

£ Rsyncing Discord (Local to Server) 
rsync -av -e "ssh -p ${PORT}" /home/koders/Documents/Knights $USERNAME@$HOST_IP:/home/$USERNAME/Discord/
rsync -av -e "ssh -p ${PORT}" /home/koders/Documents/Koders $USERNAME@$HOST_IP:/home/$USERNAME/Discord/
rsync -av -e "ssh -p ${PORT}" /home/koders/Documents/Placements $USERNAME@$HOST_IP:/home/$USERNAME/Discord/

£ Rsyncing Github (Local to External Space)
rsync -av /home/koders/ghorg/$ORG_NAME/ /media/koders/Koders/ Backup/Koders\ Data/Rsync/Github/

£ Rsyncing Discord (Local to Server) 
rsync -av -e "ssh -p ${PORT}" /home/koders/ghorg/$ORG_NAME/ $USERNAME@$HOST_IP:/home/$USERNAME/Github

