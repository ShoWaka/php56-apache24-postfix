# https://wiki.debian.org/LTS を参照したところdebian:busterがサポート切れ
# bullseyeは2026年9月31日までサポート
FROM debian:bullseye
RUN apt-get update
RUN apt-get update

RUN apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates wget
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get install -y \
    apache2 \
    php5.6 \
    php5.6-mysql \
    php5.6-mbstring \
    libapache2-mod-php5.6 \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod php5.6
RUN a2enmod rewrite
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
RUN echo '<Directory /var/www/>\n\tAllowOverride All\n</Directory>' >> /etc/apache2/apache2.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

RUN apt update && apt upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt install postfix -y

RUN apt install sasl2-bin -y
RUN DEBIAN_FRONTEND=noninteractive apt install cyrus-imapd -y

COPY conf/entrypoint.sh /entrypoint.sh
COPY conf/main.cf /etc/postfix/main.cf

RUN chmod 700 /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]