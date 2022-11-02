# Add Official PPA
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
# Run as sudo/admin 👇
./nodesource_setup.sh
# Update APT
apt update
# Install updated NodeJS
apt install nodejs -y