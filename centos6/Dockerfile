FROM centos:6
MAINTAINER Pasenger <pasenger@163.com>
ADD ./php-5.6.23.tar.gz /root/soft
ADD ./nginx-1.10.1.tar.gz /root/soft
ADD ./SeasLog-1.5.6.tgz /root/soft
ADD ./cphalcon-phalcon-v2.0.13.zip /root/soft
ADD ./start-service.sh /root 
ADD ./php.ini /root
ADD ./php-fpm.conf /root
ADD ./http_80.conf /root
ADD ./nginx.conf /root
RUN mkdir -p /var/log/php/seaslog \
	&& mkdir -p /var/log/nginx \
	&& mkdir -p /var/log/php \
	&& touch /var/log/nginx/error.log \
	&& yum -y install epel-release \
	&& yum -y update \
	&& yum -y install gcc automake autoconf libtool make gcc gcc-c++ dos2unix libjpeg libjpeg-devel libcurl libcurl-devel libpng libpng-devel freetype freetype-devel libpng libpng-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses curl openssl-devel gdbm-devel db4-devel libXpm-devel libX11-devel gd-devel gmp-devel readline-devel libxslt-devel expat-devel xmlrpc-c xmlrpc-c-devel libmcrypt libmcrypt-devel php-mcrypt \
	&& cd /root/soft/php-5.6.23 \
	&& ./configure --prefix=/opt/php --with-mysql --enable-fpm --enable-soap --with-libxml-dir --with-openssl --with-mcrypt --with-mhash --with-pcre-regex --with-sqlite3 --with-zlib --enable-bcmath --with-iconv --with-bz2 --enable-calendar --with-curl --with-cdb --enable-dom --enable-exif --enable-fileinfo --enable-filter --with-pcre-dir --enable-ftp --with-gd --with-openssl-dir --with-jpeg-dir --with-png-dir --with-zlib-dir --with-freetype-dir --enable-gd-native-ttf --enable-gd-jis-conv --with-gettext --with-gmp --with-mhash --enable-json --enable-mbstring --disable-mbregex --disable-mbregex-backtrack --with-libmbfl --with-onig --enable-pdo --with-pdo-mysql --with-zlib-dir --with-pdo-sqlite --with-readline --enable-session --enable-shmop --enable-simplexml --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-libxml-dir --with-xsl --enable-zip --enable-mysqlnd-compression-support --with-pear --enable-opcache \
	&& make \
	&& make install \
	&& make clean \
	&& ln -s -f /opt/php/bin/phpize /usr/local/bin/phpize \
	&& ln -s -f /opt/php/bin/php /usr/local/bin/php \
	&& ln -s -f /opt/php/bin/php-config /usr/local/bin/php-config \
	&& ln -s -f /opt/php/bin/php-cgi /usr/local/bin/php-cgi \
	&& ln -s -f /opt/php/sbin/php-fpm /usr/local/sbin/php-fpm \
	&& cd /root/soft/php-5.6.23/ext/opcache \
	&& phpize \
	&& ./configure --with-php-config=/opt/php/bin/php-config \
	&& make \
	&& make install \
	&& make clean \
	&& cd /root/soft/SeasLog-1.5.6 \
	&& phpize \
	&& ./configure --with-php-config=/opt/php/bin/php-config \
	&& make \
	&& make install \
	&& make clean \
	&& cd /root/soft \
	&& yum -y install php-devel pcre-devel zip unzip \
	&& unzip cphalcon-phalcon-v2.0.13.zip \
	&& cd cphalcon-phalcon-v2.0.13/build \
	&& ./install \
	&& cd /root/soft/nginx-1.10.1 \
	&& ./configure --prefix=/opt/nginx \
	&& make \
	&& make install \
	&& make clean \
	&& cd /root \
	&& rm -rf soft \
	&& ln -s -f /opt/nginx/sbin/nginx /usr/local/sbin/nginx \
	&& mkdir -p /opt/nginx/conf/servers \
	&& cd /opt/nginx/conf \
	&& mv nginx.conf nginx.conf.bak \
	&& dos2unix /root/start-service.sh \
	&& chmod a+x /root/start-service.sh \
	&& mv /root/php.ini /opt/php/lib/ \
	&& mv /root/php-fpm.conf /opt/php/etc/ \
	&& mv /root/nginx.conf /opt/nginx/conf/ \
	&& mv /root/http_80.conf /opt/nginx/conf/servers/ \
	&& ln -s -f /opt/php/lib/php.ini /etc/php.ini \
	&& ln -s -f /opt/php/etc/php-fpm.conf /etc/php-fpm.conf \
	&& ln -s -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& yum clean all


EXPOSE 80 9000

CMD /root/start-service.sh
