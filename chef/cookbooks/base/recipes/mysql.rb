#
# Cookbook Name:: base
# Recipe:: mysql
#

# Install and configure MySQL service
mysql_service "default" do
  port "3306"
  version "5.6"
  bind_address "0.0.0.0"
  initial_root_password "root"
  action [:create, :start]
end
