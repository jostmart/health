
# Php health check


### Hiera config example

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

