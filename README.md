Vagrant
=======

Vagrant setup for local MSP Developer Instances.


# Requirements

* Ruby (already installed in MacOS X)
* Librarian Chef - [rubygems.org](https://rubygems.org/gems/librarian-chef)
* VirtualBox - [virtualbox.org](https://www.virtualbox.org/wiki/Downloads)
* Vagrant - [vagrantup.com](http://vagrantup.com/)
* Vagrant Omnibus Plugin - [schisamo/vagrant-omnibus](https://github.com/schisamo/vagrant-omnibus)
* Ubuntu Base Box - [vagrant docs](https://docs.vagrantup.com/v2/boxes/base.html), [vagrantbox.es](http://www.vagrantbox.es/)
* Modified Hosts File
* Decent Internet Connection

# Install

1. Install VirtualBox, Vagrant, Vagrant Omnibus plugin, Librarian-Chef gem.

2. Clone this repository and start the vagrant
```bash
git clone git@github.com:mysmartprice/vagrant.git
cd dev.mysmartprice.com
```

3. Get the required cookbooks
```bash
librarian-chef install
```

4. Comparables code base
```bash
git clone git@github.com:mysmartprice/comparables.git # or your own fork
```

5. Vagrant UP!
```bash
vagrant up
```

Any queries? Ping on IRC @ irc.mspsg.in

That's it! Start coding already :-)
