#
# Make sure the directory already exist for where you want to place your ini-file
#
class health::ini_settings (
  $settings,
  $path,
  $inifilename,
) {

  validate_hash($settings)
  $defaults = { 'path' => "${path}/${inifilename}" }

  create_ini_settings($settings, $defaults)
}

