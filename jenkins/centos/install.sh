# !/bin/bash
# ===============================================
# ================== JENKINS ====================
# ===============================================

sudo yum update -y;
sudo yum install default-jdk -y;
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null;
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null;

sudo yum update -y;
sudo yum install jenkins -y;
sudo yum provides *bin/semanage;
sudo yum install git nano vim wget curl net-tools policycoreutils-python-utils -y;

sudo systemctl enable --now jenkins;
sudo systemctl start jenkins;
sudo systemctl status jenkins;

sudo semanage port -a -t ssh_port_t -p tcp 80;
sudo semanage port -a -t ssh_port_t -p tcp 443;
sudo semanage port -a -t ssh_port_t -p tcp 8080;
sudo semanage port -a -t ssh_port_t -p tcp 8088;

sudo firewall-cmd --permanent --add-port=80/tcp;
sudo firewall-cmd --permanent --add-port=443/tcp;
sudo firewall-cmd --permanent --add-port=8080/tcp;
sudo firewall-cmd --permanent --add-port=8088/tcp;
sudo firewall-cmd --reload;

sudo systemctl enable firewalld;
sudo systemctl restart firewalld

sudo service sshd restart;

sudo cat /var/lib/jenkins/secrets/initialAdminPassword >> /root/jenkins.password;
sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=80/g' /etc/default/jenkins;
sudo sed -i 's/HTTP_PORT=80/HTTP_PORT=8080/g' /etc/default/jenkins;

sudo /etc/init.d/jenkins restart;
sudo /etc/init.d/jenkins start;
