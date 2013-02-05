# Using sinatra with phusion passenger and apache2

This is a short destription of how to add a sinatra application into a subfolder. All provided commands apply to debian wheezy.

## Prerequisits

Ruby, sinatra, apache and passenger should have been installed.
```
      aptitude install ruby
      gem install sinatra
      aptitude install apache2
      gem install passenger
      passenger-install-apache2-module
```

## Use

By default the apache2 web root is `/var/www`. We assume the applications to be installed into a different folder, here `/var/webapp`. Our application may be called aps_test (short for apache-passenger-sinatra-test). The applications needs at least a rackup config file `config.ru` and an public folder.

We have to make the applications public folder available in the web root by use of a symbolic link.
```
   ln -s /var/webapp/aps_test/public /var/www/aps_test
```

Apache must be configured. We therefore add the following to `/etc/apache2/sites-available/default` in the <VirtualHost> element.
```
       <Directory /var/www/aps_test>
        RackBaseURI /aps_test
         Options -MultiViews
       </Directory>
```

Afterwards we may restart apache.
```
           service apache2 restart
```

And visit the new application.
```
    curl localhost/aps_test
```
