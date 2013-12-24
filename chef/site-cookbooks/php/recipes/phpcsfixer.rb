phpcsfixer_path = "/usr/local/bin/php-cs-fixer"

if ::File.exists?(phpcsfixer_path)
    Chef::Log.info("Updating php-cs-fixer")
    execute "php-cs-fixer self-update" do
        action :run
    end
else
    Chef::Log.info("Installing php-cs-fixer")
    remote_file "php-cs-fixer" do
        source "http://cs.sensiolabs.org/get/php-cs-fixer.phar"
        path phpcsfixer_path
        mode 0755
    end
end