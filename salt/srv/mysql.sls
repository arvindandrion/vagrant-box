install-mysql:
  pkg.installed:
    - name: mysql-server
  service.running:
    - name: mysql
    - enable: True

/etc/mysql/my.cnf:
  file.managed:
    - source: 'salt://files/my.cnf'

set-mysql-password:
  cmd.run:
    - unless: mysqladmin -uroot -proot status
    - name: mysqladmin -uroot password root
    - require:
      - service: install-mysql
