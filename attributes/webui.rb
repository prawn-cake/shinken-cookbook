default['shinken']['webui'] = {
  'credentials_data_bag' => 'secrets',
  'credentials_data_bag_item' => 'monitoring',
  'port' => '7767',
  'modules' => %w(
    auth-cfg-password
    SQLitedb
  )
}
