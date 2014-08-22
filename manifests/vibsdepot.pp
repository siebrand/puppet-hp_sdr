# VMware® ESXi bundles
class hp_sdr::vibsdepot (
  $ensure      = $hp_sdr::params::ensure,
  $stage       = $hp_sdr::params::stage,
  $gpgcheck    = $hp_sdr::params::gpgcheck,
  $dist        = $hp_sdr::params::dist,
  $release     = $hp_sdr::params::release,
  $arch        = $hp_sdr::params::arch,
  $project_ver = $hp_sdr::params::project_ver,
  $url_base    = $hp_sdr::params::url_base,
  $url_repo    = $hp_sdr::params::url_repo
) inherits hp_sdr::params {

  hp_sdr::repo { 'vibsdepot':
    ensure      => $ensure,
    keys_stage  => $stage,
    gpgcheck    => $gpgcheck,
    dist        => $dist,
    release     => $release,
    arch        => $arch,
    project_ver => $project_ver,
    url_base    => $url_base,
    url_repo    => $url_repo,
  }
}
