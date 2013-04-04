include_attribute "mysql::server"
node.set[:mysql][:server_root_password] = 'root'
node['mysql']['server_debian_password'] = 'root'
node['mysql']['server_repl_password'] = 'root'

node['composer']['install_globally'] = 'true'