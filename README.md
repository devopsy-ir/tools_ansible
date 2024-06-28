# tools

## requirements

Install 'Ansible'
```bash
apt-get install -y ansible
```
Install 'rsync' on the Ansible workstation
```bash
apt-get install rsync
```

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
In this repository you can install Matrix chat only by Ansible! But you may install the ansible roles via 2 ways alternatively: via `Bash script` OR via a single all_in_one `Ansible playbook`.

### Bash script
```bash
sudo ./install.sh <domain> <IP> <path>
```
E.g.
```bash
sudo ./install.sh PayamResan.ir 192.168.122.15 /root/tools
```

### Ansible playbook
1. In file `hosts.yml`: change variables `domain` and `tools_dir` and target host `IP`

2. Install all:

```bash
ansible-playbook -i ./hosts.yml install.yml
```
