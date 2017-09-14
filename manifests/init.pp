#
# 
#
class health (
  $settings
) {

  validate_hash($settings)
  create_resources('health::healthscript', $settings )

} 
