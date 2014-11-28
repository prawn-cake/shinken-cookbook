#
# Cookbook Name:: shinken
# Recipe:: default
#
# Copyright (C) 2014 EverTrue, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

user node['shinken']['user'] do
  home node['shinken']['home']
  shell '/bin/bash'
end

include_recipe 'apt' if node['platform_family'] == 'debian'
include_recipe 'python'

package 'libcurl4-openssl-dev'
package 'nagios-plugins'

if node['platform_family'] == 'debian'
  # Some plugins (such as check_icmp) need to be run as root.  This sets their
  # setuid bit.
  %w(
    check_icmp
  ).each do |plugin|
    execute "statoverride-#{plugin}" do
      command 'dpkg-statoverride --update --add root ' \
        "#{node['shinken']['group']} 4750 /usr/lib/nagios/plugins/#{plugin}"
      not_if "test -u /usr/lib/nagios/plugins/#{plugin}"
      action  :run
    end
  end
end

include_recipe 'shinken::install'
include_recipe 'shinken::webui'
#include_recipe 'shinken::keys'
include_recipe 'shinken::definitions'
include_recipe 'shinken::broker'
include_recipe 'shinken::arbiter'

%w(
  shinken
  shinken-arbiter
  shinken-broker
  shinken-poller
  shinken-reactionner
  shinken-receiver
  shinken-scheduler
).each do |svc|
  service svc do
    action [:enable, :start]
  end
end

execute 'shinken-init' do
  command 'shinken --init'
  user node['shinken']['user']
  environment('HOME' => node['shinken']['home'])
  creates "#{node['shinken']['home']}/.shinken.ini"
  action  :run
end

