# tools
Ansible  - Copy Nginx dirs of 'vhost.d' and etc.

# requirements

Install 'Ansible'

Install 'rsync' on the Ansible workstation

Add your SSH public key to root@localhost:
```bash
ssh-keygen
ssh-copy-id root@localhost
```

Add your SSH public key to root@matrix:
```bash
ssh-keygen
ssh-copy-id root@matrix
```

Add: 'StrictHostKeyChecking=accept-new' to your ssh config

## Install
sudo ./install.sh <domain> <IP> <path>
sudo ./install.sh ghasedak.ir 192.168.122.15 /root/tools
