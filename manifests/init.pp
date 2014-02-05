class opsview {
  
  file { '/etc/puppet/opsview.conf':
    ensure  => file,
    content => 'url: http://example.com/rest
                username: foobar
                password: foobaz',
  }

}
