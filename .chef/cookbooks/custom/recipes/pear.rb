execute "pear upgrade" do
  action :run
end

execute "pear config-set auto_discover 1" do
  action :run
end

execute "pear update-channels" do
  action :run
end

execute "pear install pear.phpqatools.org/phpqatools" do
  action :run
end
