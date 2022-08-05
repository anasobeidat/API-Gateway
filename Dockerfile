FROM nginx:1.21.4-alpine

WORKDIR /etc/nginx

COPY . .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]