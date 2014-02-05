class opsview {
  
  package { 'rest-client':
    ensure => 'latest',
    provider => 'gem',
  }

  package { 'json':
    ensure => 'latest',
    provider => 'gem',
  }

  file { '/etc/puppet/opsview.conf':
    ensure  => file,
    content => 'url: http://example.com/rest
                username: foobar
                password: foobaz',
  }

}
