#! /bin/bash
# @edt ASIX M06 2019-2020
# startup.sh
# -------------------------------------

# Instal.lacio / preparacio
/opt/docker/install.sh && echo "Install Ok"

# Creació usuaris unix/samba
useradd lila
useradd roc
useradd patipla
useradd pla
echo -e "lila\nlila" | smbpasswd -a lila
echo -e "roc\nroc" | smbpasswd -a roc
echo -e "patipla\npatipla" | smbpasswd -a patipla
echo -e "pla\npla" | smbpasswd -a pla

# Activar els serveis
/usr/sbin/smbd && echo "smb Ok"
/usr/sbin/nmbd -F && echo "nmb  Ok"


