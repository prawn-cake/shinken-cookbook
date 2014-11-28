default[:shinken][:arbiter] = {
    :address    => 'localhost',
    :port       => 7700,
    :modules    => []
}

default[:shinken][:ws_arbiter] = {
    :port       => 7760,
    :username   => 'anonymous',
    :password   => 'CHANGEME'
}
