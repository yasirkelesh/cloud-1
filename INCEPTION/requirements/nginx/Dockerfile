FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default/ /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]

