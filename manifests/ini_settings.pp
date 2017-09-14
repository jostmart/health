#
# Make sure the directory already exist for where you want to place your ini-file
#
class health::ini_settings (
  $settings,
  $config_root='/srv/health',
  $inifilename,
) {


  Ini_setting { require => File["$config_root"] }

  file { $config_root:
    ensure => directory;
  }

  validate_hash($settings)
  $defaults = { 'path' => "${config_root}/${inifilename}" }

  create_ini_settings($settings, $defaults)
}

