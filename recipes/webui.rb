%w(
  webui
  auth-cfg-password
  sqlitedb
).each do |mod|
  execute "install-#{mod}" do
    command "/usr/bin/shinken install #{mod}"
    user node['shinken']['user']
    environment('HOME' => node['shinken']['home'])
    creates "#{node['shinken']['home']}/modules/#{mod}"
    action  :run
    notifies :restart, 'service[shinken]'
  end
end

template '/etc/shinken/modules/webui.cfg' do
  source 'webui.cfg.erb'
  owner  node['shinken']['user']
  group  node['shinken']['group']
  mode   0644
  notifies :restart, 'service[shinken]'
end
