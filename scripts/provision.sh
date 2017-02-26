#!/usr/bin/env bash
alias apt-get='sudo apt-get -y'

echo 'Update packages list...'
echo "------------------------"
apt-get -y update

echo 'Install Xubuntu Desktop & co...'
echo "------------------------"
export DEBIAN_FRONTEND=noninteractive
apt-get -y --force-yes --no-install-recommends install xubuntu-desktop mousepad xubuntu-icon-theme \
xfce4-goodies xubuntu-wallpapers gksu cifs-utils xfce4-whiskermenu-plugin firefox \
xarchiver filezilla

echo 'Install Chromium Browser...'
echo "------------------------"
apt-get install chromium-browser

echo 'Install OpenJDK 8...'
echo "------------------------"
apt-get install openjdk-8-jdk

echo 'Create Development directory...'
echo "------------------------"
mkdir /home/vagrant/development
mkdir /home/vagrant/development/tools
mkdir /home/vagrant/bin
sudo chmod 777 -R /home/vagrant/development/

echo 'Install Eclipse JEE...'
echo "------------------------"
wget https://eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz -P /tmp
tar xzf /tmp/eclipse-jee-*.tar.gz -C /home/vagrant/development/tools
sudo ln -s /home/vagrant/development/tools/eclipse/eclipse /home/vagrant/bin/eclipse
# TODO: Create desktop icon
#wget -N https://raw.github.com/lfiammetta/vagrant/master/settings/xubuntu/eclipse.desktop -P /tmp
#sudo mv /tmp/eclipse.desktop /usr/share/applications/
rm /tmp/eclipse-jee-*.tar.gz

echo 'Install DBeaver 2.4.0...'
echo "------------------------"
wget -c http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb -P /tmp
sudo dpkg -i /tmp/dbeaver_ce_latest_amd64.deb
apt-get install -f
rm /tmp/dbeaver*.deb

echo 'Install Git and create local repository directory'
echo "------------------------"
apt-get install git

echo 'Install Java tools...'
echo "------------------------"
apt-get install maven ant-contrib

echo 'Install Miscellanious tools...'
echo "------------------------"
apt-get install vim-gtk build-essential cmake openssh-server tmux apt-transport-https ca-certificates meld
apt-get install python python-pip

echo 'Install nginx Web Server...'
echo "------------------------"
apt-get install nginx

echo 'Install nodejs...'
echo "------------------------"
apt-get install nodejs