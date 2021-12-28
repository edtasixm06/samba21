#! /bin/bash

useradd -m -s /bin/bash unix01
useradd -m -s /bin/bash unix02
useradd -m -s /bin/bash unix03
echo -e "unix01\nunix01" | passwd unix01
echo -e "unix02\nunix02" | passwd unix02
echo -e "unix03\nunix03" | passwd unix03

cp /opt/docker/login.defs /etc/login.defs
cp /opt/docker/nslcd.conf /etc/nslcd.conf
cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
cp /opt/docker/ldap.conf /etc/ldap/ldap.conf
cp /opt/docker/common-account /etc/pam.d/common-account
cp /opt/docker/common-auth /etc/pam.d/common-auth
cp /opt/docker/common-password /etc/pam.d/common-password
cp /opt/docker/common-session /etc/pam.d/common-session
cp /opt/docker/pam_mount.conf.xml /etc/security/pam_mount.conf.xml
/usr/sbin/nscd
/usr/sbin/nslcd

# Configuració shares Samba
mkdir /var/lib/samba/public
chmod 777 /var/lib/samba/public
cp /opt/docker/* /var/lib/samba/public/.
mkdir /var/lib/samba/privat
cp /opt/docker/*.md /var/lib/samba/privat/.
cp /opt/docker/smb.conf /etc/samba/smb.conf
# Creació d'usuaris unix + samba locals per a test samba 
useradd -m -s /bin/bash patipla
useradd -m -s /bin/bash roc
useradd -m -s /bin/bash lila
useradd -m -s /bin/bash pla
echo -e "patipla\npatipla" | smbpasswd -a patipla
echo -e "roc\nroc" | smbpasswd -a roc
echo -e "lila\nlila" | smbpasswd -a lila
echo -e "pla\npla" | smbpasswd -a pla

bash /opt/docker/ldapusers.sh

/usr/sbin/smbd && echo "smb Ok"
/usr/sbin/nmbd -F




