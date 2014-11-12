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
    bundle exec rake db:setup (see note)
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

__NOTE:__ The rake db:setup command creates the database in the current environment. If it's already created, or you will be creating it in another manner, such as with a test framework that uses it to reset the db, it can be entirely skipped over.
