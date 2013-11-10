name              "custom"
maintainer        "Mike Barrett"
maintainer_email  "mike182uk@gmail.com"
description       "Misc bootstrapping for a LAMP node"

depends "php"

recipe "custom::pear", "Installs pear packages"
recipe "custom::phpcsfixer", "Installs php-cs-fixer"
