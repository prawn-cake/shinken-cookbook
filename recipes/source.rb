package 'unzip'

ark 'shinken' do
  url node['shinken']['source_url']
  checksum node['shinken']['source_checksum']
  path Chef::Config[:file_cache_path]
  action :put
  notifies :run, 'execute[shinken_setup_py]'
end

execute 'shinken_setup_py' do
  command 'python setup.py install'
  creates '/usr/bin/shinken'
  cwd "#{Chef::Config[:file_cache_path]}/shinken"
end
