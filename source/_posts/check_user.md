---
title: shell判断当前用户是否有root权限

---


```shell
SUDO=''
if [ "$(id -u)" != "0" ]; then
    SUDO='sudo'
    echo "This script requires superuser access."
    echo "You will be prompted for your password by sudo."
    # clear any previous sudo permission
    sudo -k
fi
```