TYPO3Flow Vagrant Box
==============================

Copyright 2013, Thomas Layh <thomas@layh.com>

Description:
--------------

Will install a TYPO3Flow Welcome package including all required setups for the server environment.


Installation:
--------------

1. Download the Vagrant installer from:
	http://downloads.vagrantup.com/

2. Install Librarian and librarian-chef and vagrant-vbguest
	vagrant plugin install librarian
	vagrant plugin install librarian-chef
	vagrant plugin install vagrant-vbguest

3. Install required cookbooks
	librarian-chef install

4. Add to your host file
	192.168.23.3 typo3.flow

5. Run "vagrant up"
	

6. Shutdown with "vagrant suspend" and restart with "vagrant resume"
	
