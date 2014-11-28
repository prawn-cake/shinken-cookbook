execute "install-ws_arbiter" do
    command 'shinken install ws-arbiter'
    user    node[:shinken][:user]
    environment({"HOME" => node[:shinken][:home]})
    creates "#{node[:shinken][:home]}/modules/ws_arbiter"
    action  :run
end

template "#{node[:shinken][:settings]}/modules/ws_arbiter.cfg" do
    source "ws_arbiter.cfg.erb"
    owner  node[:shinken][:user]
    group  node[:shinken][:group]
    mode   0644
end
