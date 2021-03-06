# == Define: swrepo::repo
#
# This define manages a repo instance
#
define swrepo::repo (
  $repotype,
  $baseurl,
  $enabled          = '1',
  $autorefresh      = undef,
  $gpgcheck         = undef,
  $gpgkey_keyid     = undef,
  $gpgkey_source    = undef,
  $priority         = undef,
  $keeppackages     = undef,
  $type             = undef,
  $descr            = undef,
  $exclude          = undef,
  $proxy            = undef,
  $downcase_baseurl = false,
) {

  if $downcase_baseurl {
    $baseurl_real = downcase($baseurl)
  } else {
    $baseurl_real = $baseurl
  }

  case $repotype {
    'yum': {
      yumrepo { $name:
        baseurl  => $baseurl_real,
        descr    => $descr,
        enabled  => $enabled,
        gpgcheck => $gpgcheck,
        gpgkey   => $gpgkey_source,
        priority => $priority,
        exclude  => $exclude,
        proxy    => $proxy,
      }
    }
    'zypper': {
      zypprepo { $name:
        baseurl      => $baseurl_real,
        descr        => $descr,
        enabled      => $enabled,
        gpgcheck     => $gpgcheck,
        gpgkey       => $gpgkey_source,
        priority     => $priority,
        keeppackages => $keeppackages,
        type         => $type,
        autorefresh  => $autorefresh,
      }
    }
    'apt': {
      notice('apt support coming')
    }
    default: {
      fail("Invalid repotype ${repotype}. Supported repotypes are yum, zypper and apt.")
    }
  }

  if $repotype =~ /yum|zypper/ and ($gpgkey_source and $gpgkey_keyid) {
    rpmkey { $gpgkey_keyid:
      ensure => present,
      source => $gpgkey_source,
    }
  }
}
