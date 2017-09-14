#
# 
#
class health (
  $settings
) {

  # Deploy .ini file with settings for the healthscript
  include health::ini_settings

  validate_hash($settings)
  create_resources('health::healthscript', $settings )

} 
