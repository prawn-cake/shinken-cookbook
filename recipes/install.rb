include_recipe "shinken::#{node['shinken']['install_type']}"

python_pip 'pycurl'
