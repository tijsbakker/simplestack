nodejs:
  pkgrepo.managed:
    - ppa: chris-lea/node.js
    - require_in:
      - pkg: nodejs
  pkg.latest:
    - refresh: true

npm-packages:
  npm.installed:
    - names:
      - bower
      - grunt-cli