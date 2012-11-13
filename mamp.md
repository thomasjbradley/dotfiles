# Installing MAMP with Homebrew

- Run `bootstrap.sh` first to create the needed symlinks
- Make sure Dropbox has the correct permissions

		chmod -R +x ~/Dropbox
- Double check the etc/hosts file for the right virtual host names

## MySQL

<http://ratvars.com/operating-systems/mac/how-to-install-apache-php-and-mysql-stack-on-macos-lion/>

	brew install mysql
	unset TMPDIR
	mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

### Commands

	mysql.server start
	mysql.server stop

	mysql_secure_installation

### Preparing socket for PHP

	sudo mkdir /var/mysql
	sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

## PHP

<https://github.com/josegonzalez/homebrew-php>

	brew tap homebrew/dupes
	brew tap josegonzalez/homebrew-php
	brew install zlib freetype jpeg libpng gd gettext mcrypt
	brew install php54 --with-mysql

**PHP will require X11 on Mountain Lion: <http://xquartz.macosforge.org/landing/>**

<http://blog.lylyn.com/?p=37>

## Apache

Remember your backup http.conf file

	sudo ln -sf /Users/thomasjbradley/Dropbox/Preferences/MAMP/httpd.conf /etc/apache2/httpd.conf

### PHP module

	LoadModule php5_module /usr/local/Cellar/php54/5.4.3/libexec/apache2/libphp5.so

### Commands

	sudo apachectl start
	sudo apachectl stop

---

## Other methods

- http://php-osx.liip.ch/
