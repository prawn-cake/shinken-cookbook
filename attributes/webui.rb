default['shinken']['webui'] = {
  'source_url' =>
    'https://github.com/shinken-monitoring/mod-webui/archive/' \
      'dab8e74414cc1200cb79a1d3987cce405ff94f9e.zip',
  'source_checksum' =>
    '77714c3464f96f04cee0905a86b666739d267bd48ba8452743a8f3469132789a',
  'credentials_data_bag' => 'secrets',
  'credentials_data_bag_item' => 'monitoring',
  'port' => '7767',
  'modules' => %w(
    auth-cfg-password
    SQLitedb
  )
}
