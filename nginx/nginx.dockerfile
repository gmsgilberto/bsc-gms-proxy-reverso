FROM nginx:1.17.6-alpine
RUN apk update
RUN apk add bash
RUN  mv -f /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.bkp
RUN  mv -f /etc/nginx/nginx.conf  /etc/nginx/nginx.bkp

COPY ./config/nginx.conf /etc/nginx/nginx.conf 
COPY ./config/default.conf /etc/nginx/conf.d/default.conf
COPY ./config/proxy-reverso.conf /etc/nginx/conf.d/proxy-reverso.conf

COPY ./html/welcome.html /usr/share/nginx/html/index.html
COPY ./html/404.html /usr/share/nginx/html/404.html
COPY ./html/img /usr/share/nginx/html/img
VOLUME [ "/var/log/nginx/" ]

EXPOSE 80
EXPOSE 9161
LABEL name=bsc-gms-proxy-reverso
LABEL version=1.0


