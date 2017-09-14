#
# $path    - path to where health.php should be created
# $inifile - full path and filename to the ini file health.php reads
# $section - Section to read inside health.php
#

define health::health_php ($path='/srv/health', $inifile='health.ini', $template='health.php.erb', $section )
{

  # deploy health.php in a pre existing directory
  file { 'health.php': 
    name    => "${path}/health.php",
    content => template($template),
    ensure  => present;
  }

}
