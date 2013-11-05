TYPO3Flow Vagrant Box
==============================

Copyright 2013, Thomas Layh // http://layh.com

Description:
--------------

Will install a TYPO3Flow Welcome package including all required setups for the server environment.


Installation:
--------------

1. Download the Vagrant installer from:
    http://downloads.vagrantup.com/

2. Install Librarian and librarian-chef and vagrant-vbguest
::
    vagrant plugin install librarian
    vagrant plugin install librarian-chef
    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-librarian-chef

3. Install required cookbooks
::
  librarian-chef install

4. Add to your host file
::
   192.168.23.3 typo3.flow

5. Run "vagrant up"
	Will take about 10 Minutes, depending on your system speed and download rate

6. Shutdown with "vagrant suspend" and restart with "vagrant resume"
	This will save the state of the virtual machine. Make sure all your developed stuff is saved
	somewhere, because if the box crashes for some reason, everything will be gone.
