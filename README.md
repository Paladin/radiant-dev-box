A Virtual Machine for Radiant Development
=========================================

Requirements
------------

* [VirtualBox][vbox-download]
* [Vagrant][vagrant-download]

Usage
-----

If you don't have the [_precise64_ base box][base-box] it will be downloaded.

    git clone https://github.com/radiant/radiant-dev-box
    cd radiant-dev-box
    git clone https://github.com/radiant/radiant
    vagrant up
    vagrant ssh
    cd /vagrant/radiant
    bundle
    bundle exec rake app:db:bootstrap
    bundle exec rake spec

MySQL
-----

* `cp config/database.mysql.yml spec/dummy/config/database.yml`
* add `gem "mysql"` to the Gemfile
* run `bundle`

PostgreSQL
----------

* `cp config/database.postgresql.yml spec/dummy/config/database.yml`
* add `gem "pg"` to the Gemfile
* run `bundle`
* change username & password to radiant in `spec/dummy/config/database.yml`

[vbox-download]: https://www.virtualbox.org/wiki/Downloads
[vagrant-download]: http://www.vagrantup.com/downloads.html
[base-box]: http://files.vagrantup.com/precise64.box
