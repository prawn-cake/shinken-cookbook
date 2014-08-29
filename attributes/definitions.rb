default['shinken']['global_defaults'] = {
  'max_check_attempts' => 4,
  'check_period' => '24x7',
  'notification_period' => '24x7'
}
default['shinken']['service_defaults'] =
  node['shinken']['global_defaults'].merge(
    'check_interval' => 60,
    'retry_interval' => 10,
    'notification_interval' => 30
  )
default['shinken']['host_defaults'] =
  node['shinken']['global_defaults'].merge(
    'use' => 'generic-host'
  )

default['shinken']['commands'] = {
  'check_http' => {
    'command_name' => 'check_http',
    'command_line' => '$NAGIOSPLUGINSDIR$/check_http -I $HOSTADDRESS$ ' \
      '--onredirect=follow --port=$ARG1$ --url=$ARG2$'
  },
  'check_http_content' => {
    'command_name' => 'check_http',
    'command_line' => '$NAGIOSPLUGINSDIR$/check_http -I $HOSTADDRESS$ ' \
      '--onredirect=follow --port=$ARG1$ --url=$ARG2$ --regex=$ARG3$'
  }
}

default['shinken']['host_search_query'] =
  "chef_environment:#{node.chef_environment}"
