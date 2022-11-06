# !/bin/bash
# ===============================================
# ================== JENKINS ====================
# ===============================================

sudo apt update -y;
sudo apt install default-jdk -y;
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null;
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null;

sudo apt update -y;
sudo apt install jenkins -y;

sudo systemctl enable --now jenkins;
sudo systemctl start jenkins;
sudo systemctl status jenkins;

sudo ufw allow 80;
sudo ufw allow 443;
sudo ufw allow 8080;
sudo ufw allow 8088;
sudo ufw --force enable;
sudo ufw reload;

sudo cat /var/lib/jenkins/secrets/initialAdminPassword >> /root/jenkins.password;

sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=80/g' /etc/default/jenkins;
sudo sed -i 's/HTTP_PORT=80/HTTP_PORT=8080/g' /etc/default/jenkins;

sudo /etc/init.d/jenkins restart;
sudo /etc/init.d/jenkins start;
