#!/bin/sh
sudo killall -KILL apt.systemd.daily
sudo mv /etc/apt/apt.conf.d/50appstream /etc/apt/apt.conf.d/50appstream.disable
sudo apt update -y
sudo apt upgrade -y
sudo mv /etc/apt/apt.conf.d/50appstream.disable /etc/apt/apt.conf.d/50appstream
sudo apt update -y

sudo apt-get install -y git
sudo apt-get install -y curl g++ make
sudo apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
sudo apt-get install -y sqlite3 libsqlite3-dev nodejs

git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git  ~/.rbenv/plugins/
sudo sh ~/.rbenv/plugins/install.sh
rbenv install 2.3.0
rbenv global 2.3.0

touch ~/.gemrc
echo install: --no-ri --no-rdoc > ~/.gemrc
echo update: --no-ri --no-rdoc >> ~/.gemrc

gem install rails --version="~> 4.2"
rbenv rehash
