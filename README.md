# Puppet module for HP SDR setup

[![Puppet Forge](http://img.shields.io/puppetforge/v/vholer/hp_sdr.svg)](https://forge.puppetlabs.com/vholer/hp_sdr)

This module configures client for
[HP Service Delivery Repositories](http://downloads.linux.hp.com/SDR/index.html).

### Requirements

Module has been tested on:

* Puppet 3.0
* OS:
  * RHEL 6
  * Debian 7

Required modules:

* apt (https://github.com/puppetlabs/puppetlabs-apt)
* yum (https://github.com/CERIT-SC/puppet-yum)
* zypprepo (https://github.com/deadpoint/puppet-zypprepo)
* stdlib (https://github.com/puppetlabs/puppetlabs-stdlib)

# Quick Start

There are predefined classes for common repositories:

* `hp_sdr::spp` (Service Pack for ProLiant)
* `hp_sdr::mcp` (Management Component Pack for ProLiant)
* `hp_sdr::isp` (Integrity Support Pack)
* `hp_sdr::iwbem` (Integrity WBEM Providers)
* `hp_sdr::mlnx_ofed` (Mellanox OFED VPI Drivers and Utilities)
* `hp_sdr::vibsdepot` (VMware® ESXi bundles)
* `hp_sdr::hpsum` (HP Smart Update Manager)
* `hp_sdr::stk` (HP ProLiant Scripting Toolkit)

```puppet
include hp_sdr::spp
include hp_sdr::mcp
include hp_sdr::isp
include hp_sdr::iwbem
include hp_sdr::mlnx_ofed
include hp_sdr::vibsdepot
include hp_sdr::hpsum
include hp_sdr::stk
```

Full configuration options:

```puppet
class { 'hp_sdr::spp':
  ensure      => present|absent,  # ensure state
  keys_stage  => main,            # run stage for hp_sdr::gpgkeys
  gpgcheck    => 1|0,             # check GPG signatures
  dist        => '...',           # OS code name
  release     => '...',           # OS version
  arch        => '...',           # OS architecture
  project_ver => 'current',       # HP bundle version
  url_base    => '...',           # URL base part
  url_repo    => '...',           # URL repo. specific part
}
```

# Contributors

* Håkon Heggernes Lerring <hakon@powow.no>
