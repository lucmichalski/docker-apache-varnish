#!/bin/bash

APACHE_OPTIONS=${APACHE_OPTIONS:-"Indexes FollowSymLinks"}

cat -  <<EOF
<VirtualHost *:8080>
	ServerAdmin webmaster@localhost
	DocumentRoot ${PATH_HTML}
	ServerName localhost

    <Directory />
        Options FollowSymLinks
        AllowOverride None
    </Directory>

    <Directory ${PATH_HTML}>
        Options ${APACHE_OPTIONS}
        AllowOverride ${APACHE_ALLOW_OVERRIDE:-"None"}
        Order allow,deny
        Allow from all
    </Directory>

    LogLevel warn
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF
