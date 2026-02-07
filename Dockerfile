FROM nginx:1.21-alpine


RUN mkdir -p /var/cache/nginx \
 && chmod -R 777 /var/cache/nginx \
 && chmod -R 777 /etc/nginx

USER 1001
COPY index.html /usr/share/nginx/html/index.html

