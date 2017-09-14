
# Php health check

## Usage

Include class health in some manifest. Class ini_settings are included from class health.
I use Hiera to store data, so all examples are based on this.

The class health will take a template and write it to disk as a file to use in health checks or whatever.
You can create more templates in order to check more stuff than what is provided from this modules template(s).


### Hiera config example

#### Settings for class health::ini_settings

##### `ini_settings::config_root`
What directory your script want to read its ini-file from.

##### `ini_settings::inifilename`
What your script want the ini-file to be named.

##### `ini_settings::settings`
Should be a hash containing whatever you want to put into the ini-file.
Look at the module https://github.com/puppetlabs/puppetlabs-inifile for more formating documentation.

    health::ini_settings::config_root: '/srv/health'
    health::ini_settings::inifilename: 'health.ini'
    
    health::ini_settings::settings:
      'web':
        db_host: db.example.com
        db_name: testing_db
        db_user: username
        db_password: 'somepassword for the web user at testing_db'
      'api':
        db_host: db.server.com 
        db_name: api_db
        db_user: api_user
        db_password: 'password for the api_user'


### Settings for class health

You are free to create new templates for whatever check you want to create.
Since you send template as an argument in the settings, and which inifile it reads, 
it's very flexible. You will have to match inifile, with your settings from the example above.
If you deploy the inifile /srv/health/redis_health.ini, you need to change accordingly.

You will not be able to deploy the same script_name into the same path, pretty logic.

Since the ini-file can have multiple sections, you do not need to create many ini-files if you 
have many virtualhosts. Create different sections as in the example above with web and api.
Refer to each section with parameter 'section' in the hash health::settings.


#### Explanation of each setting

##### `template`
The script you want to use for your check(s), provided in this module as a template.

##### `script_name`
When the template are written into path, script_name is the filename that should be used.

##### `path`
Where you want your template to be written into the script you want to use.

##### `inifile`
If your script uses any configuration data, point this to the inifile.

##### `section`
What section in inifile to read in order to fetch the configuration data.

    health::settings:
      'web':
        script_name: 'web_health.php'
        path: '/var/www/website1/'
        inifile: '/srv/health/health.ini'
        template: 'health.php.erb'
        section: 'web'
     'api':
        script_name: 'api_health.php'
        path: '/var/www/api/foo/bar/'
        inifile: '/srv/health/health.ini'
        template: 'health.php.erb'
        section: 'api'


