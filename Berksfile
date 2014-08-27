source 'https://api.berkshelf.com'

metadata

group :integration do
  cookbook 'mock-ec2', path: './test/cookbooks/mock-ec2'
  cookbook 'test-tools', path: './test/cookbooks/test-tools'
  cookbook 'et_hostname',
           github: 'evertrue/et_hostname-cookbook'
  cookbook 'ec2dnsserver',
           github: 'evertrue/ec2dnsserver-cookbook',
           tag: 'v2.1.0'
end
