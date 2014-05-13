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
    - xdebug
    - apc
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
- Composer installed and available globally
	- Sample `composer.json` included that contains useful QA + static analysis tools.
- Xdebug installed and setup to allow remote debugging
    - To remote debug use the following values in your ide / debugger:
        - **host:** 10.10.10.2
        - **remote port:** 9000
        - **ide key:** *<leave blank>*

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

- [Composer](https://getcomposer.org/)

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

## FAQ's

**How can i speed up provisioning?**

At the top of the `Vagrantfile` there is the constant `USE_PRECONFIGURED_LAMP_BOX` which is set to `false` by default. If you set this to `true` a preconfigured LAMP base box will be used instead of a blank ubuntu base box. You should still leave the default recipes in the run list so any config values are set accordingly but any packages that these recipes install will already be installed on the base box speeding up provisioning significantly. You can see more information about the preconfigured base box [here](https://github.com/mike182uk/packer-lamp-vagrant-chef-solo).

## Notes

I have only tested this on OS X (10.9). In theory it should work on most operating systems, although Windows will probably have a problem using NFS for synced folders.
See NFS alternatives [here](https://docs.vagrantup.com/v2/synced-folders/basic_usage.html).