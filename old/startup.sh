#! /bin/bash
# @edt ASIX M06 2019-2020
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"

# ConfiguraciÃ³ ldap
/sbin/nscd && echo "nscd Ok"
/sbin/nslcd  && echo "nslcd OK"

# ConfiguraciÃ³ samba
/usr/sbin/smbd && echo "smb Ok"
#/usr/sbin/nmbd && echo "nmb  Ok"

# -------------------------------------------------------------------
# CreaciÃ³ dels comptes samba i directoris dels usuaris ldap ---------
# ha de ser un cop activat ldap/ nslcd...
bash /opt/docker/ldapusers.sh
# ===================================================================
#/bin/bash

# Deixar-lo en foreground
/usr/sbin/nmbd -F 

