{% set ruby = salt['grains.filter_by']({
    'Debian': {
        'package': 'ruby2.2',
        'package_dev': 'ruby2.2-dev',
        'package_bundler': 'bundler',
        'install_from_source': False,
    },
    'RedHat': {
        'package': 'ruby193-ruby',
        'package_dev': 'ruby193-ruby-devel',
        'package_bundler': 'ruby193-rubygem-bundler',
        'install_from_source': False,
    },
}, merge=salt['pillar.get']('ruby')) %}

ruby_repo:
  pkgrepo.managed:
    - humanname: ruby-ppa-{{ grains['oscodename'] }}
    - name: deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/ruby-{{ grains['oscodename'] }}.list
    - dist: {{ grains['oscodename'] }}
    - keyid: C3173AA6
    - keyserver: keyserver.ubuntu.com

ruby:
  pkg.installed:
    - names:
      - {{ ruby.package }}
      - {{ ruby.package_dev }}
      - {{ ruby.package_bundler }}
      - ruby-switch
    - require:
      - pkgrepo: ruby_repo

  cmd.run:
    - name: ruby-switch --set {{ ruby.package }}
    - require:
      - pkg: ruby

old_ruby_purged:
  pkg.purged:
    - names:
      - ruby1.8
      - rubygems
      - rake
      - ruby-dev
      - libreadline5
      - libruby1.8
      - ruby1.8-dev
      
bundler:
  gem.installed
  
highline:
  gem.installed
  
httparty:
  gem.installed