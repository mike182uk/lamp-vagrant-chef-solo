Vagrant.configure("2") do |config|

    # Box
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Networking
    config.vm.network :forwarded_port, guest: 80, host: 8080

    # Synced folders
    config.vm.synced_folder "./", "/var/www"

    # Provisioning via chef solo
    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = ".chef/cookbooks"

        chef.add_recipe "apt"
        chef.add_recipe "git"
        chef.add_recipe "curl"
        chef.add_recipe "custom::wget"
        chef.add_recipe "zip"
        chef.add_recipe "openssl"
        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_rewrite"
        chef.add_recipe "apache2::mod_fcgid"
        chef.add_recipe "mysql::server"
        chef.add_recipe "php"
        chef.add_recipe "php::module_mysql"
        chef.add_recipe "apache2::mod_php5"
        chef.add_recipe "composer"
        chef.add_recipe "custom::phpqatools"
        chef.add_recipe "custom::phpcsfixer"

        chef.json = {
            :apache => {
                :default_site_enabled => true
            },
            :mysql => {
                :server_root_password => "root",
                :server_debian_password => "root",
                :server_repl_password => "root"
            }
        }
    end

end
