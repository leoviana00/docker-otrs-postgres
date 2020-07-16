FROM nginx

MAINTAINER Leonardo Viana <leonardo.viana@armateus.com.br>

ADD certs/ithappens.crt /etc/nginx/

ADD certs/ithappens.key /etc/nginx/

ADD index.html /usr/share/nginx/html/

ADD nginx.conf /etc/nginx/nginx.conf

VOLUME [ "/etc/nginx/", "/usr/share/nginx/html/" ]

EXPOSE 80 443
