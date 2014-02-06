class opsview {
  
  file { '/etc/puppet/opsview.conf':
    ensure  => file,
    content => template('opsview/etc/puppet/opsview.conf.erb'),
  }

}
