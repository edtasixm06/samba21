#! /bin/bash
# @edt ASIX M06 2019-2020
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"

# Configuració ldap
/sbin/nscd && echo "nscd Ok"
/sbin/nslcd  && echo "nslcd OK"

# Configuració samba
/usr/sbin/smbd && echo "smb Ok"
#/usr/sbin/nmbd && echo "nmb  Ok"

# -------------------------------------------------------------------
# Creació dels comptes samba i directoris dels usuaris ldap ---------
# ha de ser un cop activat ldap/ nslcd...
bash /opt/docker/ldapusers.sh
# ===================================================================
#/bin/bash

# Deixar-lo en foreground
/usr/sbin/nmbd -F 

