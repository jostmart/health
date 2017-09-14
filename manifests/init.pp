#
# 
#
class health (
  $settings
) {

  validate_hash($settings)
  create_resources('health::health_php', $settings );

} 


