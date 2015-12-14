# Install repositories

# Install nginx repo
base:
  pkgrepo.managed:
    - ppa: nginx/stable
  pkg.latest:
    - name: nginx
    - refresh: True