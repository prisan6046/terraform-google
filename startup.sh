curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

sudo apt-get install -y docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

sudo usermod -aG docker ubuntu
sudo chmod 777 /var/run/docker.soc

sudo docker login -u dockerbla1234 -p Wenwen6046. https://registry-1.docker.io
sudo docker pull nginx
sudo docker run --name mynginx1 -p 80:80 -d nginx
