# == Class: nsswitch
#
# This module manages nsswitch.
#
# == Parameters:
#
# [*config_file*]
# Path to configuration file
# - *Default*: `/etc/nsswitch.conf`
#
# [*ensure_ldap*]
# Should LDAP be used? Valid values are 'absent' and 'present'
# - *Default*: 'absent'
#
# [*ensure_qas*]
# Should QAS (Quest Authentication Services) be used?
# Valid values are 'absent' and 'present'
# - *Default*: 'absent'
#
# [*qas_nss_module*]
# Name of NSS module to use for QAS
# - *Default*: 'vas4'
#
class nsswitch (
  $config_file    = '/etc/nsswitch.conf',
  $ensure_ldap    = 'absent',
  $ensure_qas     = 'absent',
  $qas_nss_module = 'vas4',
) {

  file { 'nsswitch_config_file':
    ensure  => file,
    path    => $config_file,
    content => template('nsswitch/nsswitch.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
