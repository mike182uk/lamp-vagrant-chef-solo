name              "custom"
maintainer        "Mike Barrett"
maintainer_email  "mike182uk@gmail.com"
description       "Misc bootstrapping for a LAMP node"

depends "php"

recipe "custom::phpqatools", "Installs PHP QA Tools (PHPUnit, PHPMD, PHPCPD etc) via pear"
recipe "custom::phpcsfixer", "Installs PHP CS Fixer"
