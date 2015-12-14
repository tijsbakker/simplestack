monit:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: monit