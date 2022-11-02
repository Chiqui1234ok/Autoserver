# ⚡ RUN AS ROOT ⚡
# Perform an update for future installations
apt update
# Install dependencies
apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
# wget credentials of new repository
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
# Add the repo to sources.list
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
# Perform another update on APT
apt update
# Install MongoDB Community
apt-get install -y mongodb-org
# Start MongoDB Service without reboot
systemctl start mongod
# Enable MongoDB as an auto-start service
systemctl enable mongod
# Print mongod status
systemctl status mongod
# Delay console 3 seconds
sleep 3
# Check MongoDB functionality with a simple command
mongo --version
# Another command for checking functionality (optional)
# mongo --eval 'db.runCommand({ connectionStatus: 1 })'