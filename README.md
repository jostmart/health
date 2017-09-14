
# Php health check


### Hiera config example

Path: This is how you configure where the health check file will we stored.
inifile: What .ini-file should the health check script read
section: What section inside the .ini-file should each script use
template: You can create different templates for the health check file

    health::settings:
      'web':
        path: '/var/www/web/deploys/current/'
        inifile: '/srv/health/health.ini'
        section: 'web'
        template: 'health.php.erb'
      'api':
        path: '/var/www/api/deploys/current/'
        inifile: '/srv/health/health.ini'
        section: 'api'
        template: 'health.php.erb'



This is how you configure the content that will be written into the .ini-file.
You need to take care that it matches your settings for the check script.
Later on you will be able to send in an hash instead of the hardcoded parameters I have now.

    health::ini_settings::path: '/srv/health'
    health::ini_settings::inifilename: 'health.ini'
    
    healt::ini_settings::settings:
      web:
        db_host: <database IP or domain>
        db_name: <schema name>
        db_user: <username>
        db_password: <password>
     api:
        db_host: db.testing.example.com
        db_name: testdatabase
        db_user: testuser
        db_password: 194zyx

