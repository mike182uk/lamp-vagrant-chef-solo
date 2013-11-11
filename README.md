# LAMP dev box with vagrant and chef

Sets up a dev box running `Ubuntu 12.04 LTS`

Installs OS Packages:

```
git
curl
wget
zip
unzip
```

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

Enables apache `mod_rewrite`

Sets mysql root password to `root`

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

Installs [composer](http://getcomposer.org/)

Installs [php-cs-fixer](https://github.com/fabpot/PHP-CS-Fixer)

Installs [phpmyadmin](http://www.phpmyadmin.net/home_page/index.php)

### Usage

1. Make sure you have [vagrant](http://www.vagrantup.com/) installed
2. Clone this repo
3. Navigate to directory in terminal and run `vagrant up`
4. Once vagrant has done its business, if you navigate to `localhost:8080` you should see a the default apache welcom page

### Notes

1. This is meant for development environments, **not production**
