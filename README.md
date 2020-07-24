#  Ambiente otrs, posgresql e grafana 


    # ((OTRS)) Community Edition 6.0.28



## Description 
  
((OTRS)) Community Edition – The Flexible Open Source Service Management Software

((OTRS)) Community Edition is one of the most successful and long-lasting open source projects in the area of help desk and IT service management worldwide. More than 5,000 active community members improve the service management software with every release by reporting bugs, adding self-developed improvements or new functionalities, and maintaining and extending the 38 supported languages. Thanks to the open source code that is constantly reviewed by the manufacturer and the community, the open source software ((OTRS)) Community Edition is not only more secure than proprietary software but also more flexible. This is evidenced by 170,000 installations in different industry sectors such as IT & telecommunications, government, healthcare, manufacturing, education and consumer products.

https://community.otrs.com



---

## VOLUMES PARA PERSISTÊNCIA
 
- docker volume create db-otrs-volume
- docker volume create otrs-volume
- docker volume create grafana-volume
 
$ /var/lib/docker
---
## 1 - RUN PGSQL
docker run -d --name=db-otrs -p 5432:5432 -v db-otrs-volume:/var/lib/postgresql/data leoviana00/postgres-otrs

## 2 - RUN OTRS
docker run -d --name otrs --link db-otrs:db-otrs -v otrs-volume:/opt/otrs -e DBHOST="db-otrs" leoviana00/otrs:6.0.28
 
## 3 - RUN GRAFANA
docker run -d --name=grafana --restart=always --link db-otrs:db-otrs -p 3000:3000 -e "GF_INSTALL_PLUGINS=grafana-clock-panel,briangann-gauge-panel,alexanderzobnin-zabbix-app,grafana-simple-json-datasource,grafana-image-renderer,grafana-piechart-panel" -e "GF_SERVER_PROTOCOL=http" -e "GF_SERVER_HTTP_PORT=3000" -v grafana-volume:/var/lib/grafana grafana/grafana:6.5.2


##--------------------------------------------------

- IP_OTRS/otrs/installer.pl 

- IP_OTRS/otrs/customer.pl

- IP_OTRS/otrs/index.pl

- ip_grafana:3000

##--------------------------------------------------

docker inspect otrs

http://ip-container-otrs/otrs/installer.pl

# Acessando o container

$ docker exec -it otrs /bash/bin

$ cd scripts

$ ./secure_mode.sh on

$ ./install_modeules.sh all

$ chmod +x entrepoint.sh

$ ./entrepoint.sh

# ----------------------------------------------------
# Configuração OTRS
# ----------------------------------------------------

# Email (central.ithappens@outlook.com)

- Entrada
  - imaps
  - imap-mail.outlook.com

- Saída
  - smtptls
  - smtp.live.com
  - 587

---

# Atualizar restart de um container

$ docker update --restart=always <container>





