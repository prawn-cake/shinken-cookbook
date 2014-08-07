include_recipe 'et_fog::default'

require 'fog'

::Fog.mock!

c = ::Fog::Compute::AWS.new(
  aws_access_key_id: 'MOCK',
  aws_secret_access_key: 'MOCK'
)
c.servers.create
