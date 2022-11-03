# Add Official PPA
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
# Run as sudo/admin 👇
./nodesource_setup.sh
# Update APT
apt update
# Install updated NodeJS
apt install nodejs -y
# Launch default.js
echo 'Now, default.js (server) will be launched at port 3001.'
echo 'You can view server result at http://IP:3001.'
sleep 3
node default.js