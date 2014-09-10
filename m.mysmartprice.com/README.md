# MDot

Vagrantfile and cookbook for m.mysmartprice.com

## Installation

Make sure you've followed the basic steps in the previous guide [here](http://github.com/mysmartprice/vagrant/).
```
cd m.mysmartprice.com
librarian-chef install
vagrant up
```

Clone your fork of [HTML5](http://github.com/mysmartprice/HTML5) repository in this folder.
```
git clone git@github.com:g-P/HTML5.git
```

Add the following line to your `/etc/hosts/` file
```
192.168.33.20   m.dev.mysmartprice.com
```

Navigate to http://m.dev.mysmartprice.com/ and get coding!
