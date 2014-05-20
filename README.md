vagrant-grunt
=============

Vagrant configuration with grunt, php included.

Prerequisites
=============
Please install
- Vagrant: [http://www.vagrantup.com/downloads](http://www.vagrantup.com/downloads)
- VirtualBox: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

Installation
============

Clone this repository:
----------------------
````
``````

Run vagrant:
------------
````
cd vagrant-grunt
vagrant up
````
Have a coffee - At the end you could access a simple html page at [http://localhost:8080](http://localhost:8080)

Then enter the virtual machine and locally install bower components and whatever grunt plug-ins you want:
````
vagrant ssh
cd /vagrant/www
npm install
````
Grunt is now ready to be used.

Have a look at [http://localhost:8080](http://localhost:8080), you have arrived!
