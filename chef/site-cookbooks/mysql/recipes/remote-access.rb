mysql_bin = node["mysql"]["mysql_bin"]
db_root_user = "root"
db_root_user_pass = node["mysql"]["server_root_password"]

# Grant root user privledges to access remotely
execute "grant-root-user-privledges" do
   command "#{mysql_bin} -u #{db_root_user} -p#{db_root_user_pass} -e \"GRANT ALL PRIVILEGES ON *.* TO '#{db_root_user}'@'%' IDENTIFIED BY '#{db_root_user_pass}' WITH GRANT OPTION; FLUSH PRIVILEGES;\""
end

# Restart MySQL to allow remote access (MySQL is not restarted when first installed, so if
# we didn't restart here, we would not be able to access remotely)
service "mysql" do
    action :restart
end