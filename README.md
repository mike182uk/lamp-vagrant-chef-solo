#LAMP dev box with Vagrant and Chef Solo

Sets up a LAMP dev box running `Ubuntu 12.04 LTS`.

Uses [Librarian Chef](https://github.com/applicationsonline/librarian-chef) to manage third-party cookbooks.

Installs LAMP packages:

- apache2
- mysql-server
- php5
- php5-cli
- php5-dev
- php5-mysql
- php-pear

Enables Apache modules

- mod_rewrite
- mod_alias

Sets MySQL root password to: `root`

Installs Pear packages:

- PHPUnit
- phploc
- phpmd
- PHP_CodeBrowser
- phpcs
- phpcpd
- pdepend

Installs [Composer](http://getcomposer.org/)

Installs [php-cs-fixer](https://github.com/fabpot/PHP-CS-Fixer)

Installs [phpmyadmin](http://www.phpmyadmin.net/home_page/index.php)

## Prerequisites

- [Bundler](http://bundler.io/)

- [Vagrant](http://www.vagrantup.com/) >=1.5 with the following plugins installed:

    - [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier) - Caches downloads on the box (saves you bandwidth)
    - [vagrant-ombnibus](https://github.com/schisamo/vagrant-omnibus) - Upgrades chef to the latest version on the box
    - [vagrant-librarian-chef](https://github.com/jimmycuadra/vagrant-librarian-chef) - Installs chef cookbooks listed in `chef/Cheffile`
    - [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) - Upgrades VirtualBox guest additions on the box

##Usage

Install required Ruby Gems:

```bash
bundle install
```

Setup and provision the box:

```
cd ../
vagrant up
```

Once Vagrant has done its stuff, if you navigate to `http://33.33.33.10/` in a browser you should see the default Apache welcome page.

You can access phpmyadmin at `http://33.33.33.10/phpmyadmin`.