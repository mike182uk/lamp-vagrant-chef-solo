#LAMP dev box with Vagrant and Chef Solo

Sets up a LAMP box running `Ubuntu 12.04 LTS`.

Uses [Librarian Chef](https://github.com/applicationsonline/librarian-chef) to manage third-party cookbooks.

Installs LAMP packages:

```
apache2
mysql-server
php5
php5-cli
php5-dev
php5-mysql
php-pear
```

Enables Apache `mod_rewrite`, `mod_alias`

Sets MySQL root password to `root`

Installs pear packages:

```
PHPUnit
phploc
phpmd
PHP_CodeBrowser
phpcs
phpcpd
pdepend
```

Installs [Composer](http://getcomposer.org/)

Installs [php-cs-fixer](https://github.com/fabpot/PHP-CS-Fixer)

Installs [phpmyadmin](http://www.phpmyadmin.net/home_page/index.php)

##Usage

- Make sure you have [Vagrant](http://www.vagrantup.com/) installed
- Make sure you have [Bundler](http://bundler.io/) installed
- Clone this repo, navigate to root of project and install Ruby Gem dependencies

```
git clone https://github.com/mike182uk/lamp-vagrant-chef-solo <project-path>
cd <project-path>
bundle install
```

- Navigate to the chef directory and install third-party cookbooks

```
cd chef
librarian-chef install
```

- Navigate back to the project root and start the VM

```
cd ../
vagrant up
```

- Once vagrant has done its stuff, if you navigate to `http://33.33.33.10/` in a browser you should see the default apache welcome page. You can access phpmyadmin at `http://33.33.33.10/phpmyadmin`.