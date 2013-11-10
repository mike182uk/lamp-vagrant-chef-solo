
phpcsfixer_path = "/usr/local/bin/php-cs-fixer"

if ::File.exists?(phpcsfixer_path)
    execute "php-cs-fixer self-update" do
        action :run
    end
else
    remote_file "php-cs-fixer" do
        source "http://cs.sensiolabs.org/get/php-cs-fixer.phar"
        path phpcsfixer_path
        mode 0755
    end
end
