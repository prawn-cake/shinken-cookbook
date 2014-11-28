template "#{node[:shinken][:settings]}/arbiters/arbiter-master.cfg" do
    source 'arbiter-master.cfg.erb'
    owner  node[:shinken][:user]
    group  node[:shinken][:group]
    mode   0644
end

# Install modules
node[:shinken][:arbiter][:modules].each do |module_name|
    if node.recipes.include?("shinken::#{module_name}.rb")
        include_recipe "shinken::#{module_name}"
    else
        log "Install recipe for #{module_name} is not found" do
            :level "warning"
        end
    end
end
