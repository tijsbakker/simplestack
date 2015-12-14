# hosts
hosts:
  test: 127.0.0.1

# mysql
mysql.query_cache_limit: 16M
mysql.innodb_buffer_pool_size: 256M

# redis
redis.maxmemory: 1G

# php
php.timezone: UTC
php.upload_max_filesize: 32M
php.post_max_size: 10M

# groups
groups:
  admin: 500

# hostname
hostname: {{ salt['cmd.run']('hostname') }}

# environment
{% if pillar.get('hostname') == 'vagrant-ubuntu-trusty-64' %}
environment: development
{% else %}
environment: production
{% endif %}

# users
users:
  ubuntu:
    uid: {% if pillar.get('environment') == 'production' %}
         1000
         {% else %}
         1002
         {% endif %}
    fullname: ubuntu
    groups: ['admin','www-data']
