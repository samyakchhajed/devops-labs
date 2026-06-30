#!/bin/bash
apt update -y
apt install -y nginx
systemctl enable nginx
systemctl start nginx

echo "Environment: ${env}"

cat <<EOF> /etc/nginx/sites-available/default 
server {
listen 80;

root /var/www/html;
index index.html index.htm index.nginx-debian.html;

server_name ${droplet_name};

location / {
try_files $uri $uri/ =404;
}

}
EOF

systemctl restart nginx
