# tools

## requirements

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

### Bash script
```bash
sudo ./install.sh <domain> <IP> <path>
```
E.g.
```bash
sudo ./install.sh PayamResan.ir 192.168.122.15 /root/tools
```

### Ansible
1. In file `hosts.yml`: change variables `domain` and `tools_dir` and target host `IP`

2. Install all:

```bash
ansible -i ./hosts.yml install.yml
```
