#
# $path    - path to where health.php should be created
# $inifile - full path and filename to the ini file health.php reads
# $section - Section to read inside health.php
#

define health::healthscript (
  $script_name='health.php', 
  $path='/srv/health', 
  $inifile='health.ini', 
  $template='health.php.erb', 
  $section=$name,
) {

  # deploy your health check script in a pre existing directory
  file { "${script_name}": 
    name    => "${path}/${script_name}",
    content => template("health/${template}"),
    ensure  => present;
  }

}
