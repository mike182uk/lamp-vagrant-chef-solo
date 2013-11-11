
# Discover phpqatools channel
pqa = php_pear_channel "pear.phpqatools.org" do
    action :discover
end

# Autodiscover channels (phpqatools uses packages from other channels)
execute "pear config-set auto_discover 1" do
    only_if '[ "$(pear config-get auto_discover)" = "0" ]'
end

# Upgrade pear and any channels if applicable
["upgrade", "update-channels"].each { |command|
    execute "pear #{command}" do
        action :run
    end
}

# Install phpqatools pear package
php_pear "phpqatools" do
    channel pqa.channel_name
    action :install
end
