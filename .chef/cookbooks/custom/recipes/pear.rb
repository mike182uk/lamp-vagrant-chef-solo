
# Discover phpqatools channel
pqa = php_pear_channel "pear.phpqatools.org" do
  action :discover
end

commands = [
    'upgrade', # Upgrade Pear
    'config-set auto_discover 1', # Autodiscover new channels
    'update-channels' # Update existing channels
]

commands.each { |command|
    execute "pear #{command}" do
      action :run
    end
}

# Install phpqatools pear package
php_pear "phpqatools" do
  channel pqa.channel_name
  action :install
end
