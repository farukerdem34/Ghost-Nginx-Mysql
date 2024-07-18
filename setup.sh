read -p "Enter DB Password: " -s DB_PASSWD
sudo apt-get update -y 
sudo apt-get upgrade -y 
sudo curl https://get.docker.com/ | sh 
sudo systemctl start docker 
sudo usermod -aG docker $USER 
newgrp docker 
sudo mkdir -p /var/www && cd /var/www 
sudo git clone https://github.com/farukerdem34/Ghost-Nginx-Mysql.git 
sudo chown www-data:$USER -R Ghost-Nginx-Mysql 
cd Ghost-Nginx-Mysql 
yes NA | bash gencert 
sed -i.bak "/sCHANGE_THIS/$DB_PASSWD/" compose.yml 
docker compose up
