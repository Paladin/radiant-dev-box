#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

echo 'export LANGUAGE="en_US.UTF-8"' >> /etc/profile.d/lang.sh
echo 'export LANG="en_US.UTF-8"' >> /etc/profile.d/lang.sh
echo 'export LC_ALL="en_US.UTF-8"' >> /etc/profile.d/lang.sh
echo 'export GEM_HOME=/home/vagrant/.gem/ruby/2.1' >> /etc/profile.d/gems.sh
echo 'PATH=/home/vagrant/.gem/ruby/2.1/bin:$PATH' >> /etc/profile.d/path.sh
echo 'gem: --no-ri --no-rdoc' >> /root/.gemrc
echo 'gem: --no-ri --no-rdoc' >> /home/vagrant/.gemrc

source /etc/profile.d/lang.sh
source /etc/profile.d/gems.sh
source /etc/profile.d/path.sh

apt-get update
sudo apt-get install -y --force-yes python-software-properties
sudo apt-add-repository ppa:brightbox/ruby-ng

apt-get update

apt-get install -y --force-yes \
build-essential \
git \
htop \
libxml2-dev libxslt-dev \
mysql-server mysql-client libmysqlclient-dev \
nodejs \
postgresql libpq-dev \
ruby2.1 \
ruby2.1-dev \
ruby2.1-doc \
sqlite3 libsqlite3-dev

sudo -u postgres createuser --superuser radiant
sudo -u postgres psql -c "alter role radiant with password 'radiant';"
sudo -u postgres createdb radiant

gem install bundler mysql pg sqlite3
chown -R vagrant /home/vagrant/.gem

