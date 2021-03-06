ufw:
  pkg:
    - latest
  service:
    - running
    - require:
      - pkg: ufw

ufw-allow-ssh:
  cmd.run:
  - name: ufw allow from 188.203.27.167 to any port 22
  - unless: 'ufw status | grep "^22\s*ALLOW\s*188.203.27.167"'

ufw-limit-ssh:
  cmd.run:
  - name: ufw limit ssh
  - unless: 'ufw status | grep "^22\s*LIMIT"'

ufw-allow-http:
  cmd.run:
  - name: ufw allow http
  - unless: 'ufw status | grep "^80\s*ALLOW"'

ufw-allow-https:
  cmd.run:
  - name: ufw allow https
  - unless: 'ufw status | grep "^443\s*ALLOW"'

ufw-enable:
  cmd.run:
  - name: ufw --force enable
  - unless: 'ufw status | grep "Status: active"'
