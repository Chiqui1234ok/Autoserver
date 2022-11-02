# ⚡RUN AS ROOT ⚡
# Change "proxy_pass         http://31.170.165.136:3001;" with your IP and desired port (this port need to match your NodeJs app)

# Create a new APT file for add nginx to repo
touch /etc/apt/sources.list.d/nginx.list
# Append file and put valid URL to Nginx PPA
echo -e "deb http://nginx.org/packages/ubuntu/ bionic nginx\ndeb-src http://nginx.org/packages/ubuntu/  bionic nginx" >> /etc/apt/sources.list.d/nginx.list
# Add signing key
wget --quiet http://nginx.org/keys/nginx_signing.key && sudo apt-key add nginx_signing.key
# Update APT
apt update
# Install nginx
apt install nginx -y
# Start nginx
systemctl start nginx
# Enable nginx as a service
systemctl enable nginx
# View nginx' status
systemctl status nginx
# Open ports for HTTP (80), HTTPS (443) & NodeApp (3001) in UFW (Firewall)
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 3001/tcp
# Reload firewall
ufw reload

# Create Nginx file
echo -e "server {\nlisten 80;\nserver_name sysmon.tecmint.lan;\nlocation / {\nproxy_set_header   X-Forwarded-For $remote_addr;\nproxy_set_header   Host $http_host;\nproxy_pass         http://31.170.165.136:3001;\n}\n}" >> /etc/nginx/conf.d/sysmon.conf 
# Restart nginx
systemctl restart nginx