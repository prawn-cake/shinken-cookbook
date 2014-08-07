default['shinken']['user'] = 'shinken'
default['shinken']['group'] = 'shinken'
default['shinken']['home'] = '/var/lib/shinken'
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
