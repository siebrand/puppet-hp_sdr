class hp_sdr::params {
  $stage = main
  $ensure = present
  $gpgcheck = 1

  # http://downloads.linux.hp.com/SDR/keys.html
  $gpg_key1 = template('hp_sdr/hpPublicKey1024.pub.erb')
  $gpg_key1_id = '2689B887'
  $gpg_key2 = template('hp_sdr/hpPublicKey2048.pub.erb')
  $gpg_key2_id = '5CE2D476'

  $project_ver = 'current'
  $url_base = 'http://downloads.linux.hp.com/SDR/repo'

  case $::osfamily {
    redhat: {
      $gpg_key1_path = '/etc/pki/rpm-gpg/RPM-GPG-KEY-hpPublicKey1'
      $gpg_key2_path = '/etc/pki/rpm-gpg/RPM-GPG-KEY-hpPublicKey2'

      $url_repo = '<%= @bundle %>/<%= @dist %>/<%= @release %>/<%= @arch %>/<%= @project_ver %>'
      $arch = '$basearch'
      $release = '$releasever'

      case $::operatingsystem {
        redhat,centos:  { $dist = downcase($::operatingsystem) }
        scientific,slc: { $dist = 'centos' }
        oraclelinux:    { $dist = 'oracle' }
        default:        { fail("Unsupported OS: ${::operatingsystem}") }
      }
    }

    suse: {
      $gpg_key1_path = '/etc/pki/RPM-GPG-KEY-hpPublicKey1'
      $gpg_key2_path = '/etc/pki/RPM-GPG-KEY-hpPublicKey2'

      $url_repo = '<%= @bundle %>/suse/<%= @release %>/<%= @arch %>/<%= @project_ver %>'
      $arch = $::architecture

      case $::operatingsystem {
        sles,sled: {
          $version = regsubst($::operatingsystemrelease, '\.', '-SP')
          $release = "SLES${version}"
        }

        default: {
          fail("Unsupported OS: ${::operatingsystem}")
        }
      }
    }

    debian: {
      $url_repo = '<%= @bundle %>'
      $release = $::lsbdistcodename

      unless $::operatingsystem in ['Debian','Ubuntu'] {
        fail("Unsupported OS: ${::operatingsystem}")
      }
    }

    default: {
      fail("Unsupported OS family: ${::osfamily}")
    }
  }

  # check for HP hardware
  unless $::manufacturer == 'HP' {
    fail("Unsupported manufacturer: ${::manufacturer}")
  }
}
