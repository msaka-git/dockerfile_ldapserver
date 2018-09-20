FROM msaka/ldapserver
RUN yum -y install epel-release; yum clean all
RUN yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel; yum clean all
RUN yum -y install phpldapadmin; yum clean all
COPY phpldapadmin.conf /etc/httpd/conf.d/phpldapadmin.conf
COPY config.php /etc/phpldapadmin/config.php
RUN chown root:apache /etc/phpldapadmin/config.php
CMD ["echo", "192.168.56.101 ldap_client.mpw.com ldap_client", ">>", "/etc/hosts"]
