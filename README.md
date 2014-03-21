#LAMP dev box with Vagrant and Chef Solo

Sets up a LAMP dev box running `Ubuntu 12.04 LTS`.

- LAMP packages installed:
	- apache2
	- mysql-server
	- php5
	- php5-cli
	- php5-dev
	- php5-mysql
	- php-pear
- Other useful packages installed:
	- git
	- vim
- Default Apache site enabled
- Apache modules enabled
	- mod_rewrite
	- mod_alias
- MySQL database setup
	- Database can be accessed from the host machine:
		- **host:** 10.10.10.2
		- **user:** root
		- **password:** root
- [Composer](http://getcomposer.org/) installed
	- Sample `composer.json` included that contains useful QA + static analysis tools.

## Prerequisites

- A Ruby environment with the following Gems installed:

    - [Bundler](http://bundler.io/)

- [Virtualbox](https://www.virtualbox.org/)

- [Vagrant](http://www.vagrantup.com/) >=1.5 with the following plugins installed:

    - [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier) - Caches downloads on the box (saves you bandwidth)
    - [vagrant-ombnibus](https://github.com/schisamo/vagrant-omnibus) - Upgrades chef to the latest version on the box
    - [vagrant-librarian-chef](https://github.com/jimmycuadra/vagrant-librarian-chef) - Installs chef cookbooks listed in `chef/Cheffile`
    - [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) - Upgrades VirtualBox guest additions on the box

    ```bash
    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-omnibus
    vagrant plugin install vagrant-libraian-chef
    vagrant plugin install vagrant-vbguest
    ```
##Usage

Install required Ruby Gems:

```bash
bundle install
```

Setup and provision the box:

```
vagrant up
```

Once Vagrant has done its stuff, if you navigate to `http://10.10.10.2/` in a browser you should see the default Apache welcome page.


To install QA + static analysis tools:

```
composer install --prefer-dist
```

## Notes

I have only tested this on OS X (10.9). In theory it should work on most operating systems, although Windows will probably have a problem using NFS for synced folders.
See NFS alternatives [here](https://docs.vagrantup.com/v2/synced-folders/basic_usage.html).