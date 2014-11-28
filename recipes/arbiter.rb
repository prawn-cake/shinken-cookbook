template "#{node[:shinken][:settings]}/arbiters/arbiter-master.cfg" do
    source 'arbiter-master.cfg.erb'
    owner  node[:shinken][:user]
    group  node[:shinken][:group]
    mode   0644
end
