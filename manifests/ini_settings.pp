class health::ini_settings (
  $settings,
  $path,
  $inifilename,
) {

  validate_hash($settings)
  $defaults = { 'path' => "${path}/${inifilename}" }

  file { $path: 
    ensure => directory,
    mode   => '0750',
    before => Define["Create_ini_settings"];
  }

  create_ini_settings($settings, $defaults)
}

