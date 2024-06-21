Forked from: [vitalk/ansible-secure-ssh](https://github.com/vitalk/ansible-secure-ssh)

Requirements
==========

There are some steps to do on the remote server manually:

* Clone whole infra repo by: `git clone https://git.payamena.ir/scm/devops/infra.git`

* Login to Nilvaos docker registry by: `docker login docker.nilvaos.ir`

Up this matrix app update notif api
--------------

For example, you can override default variables by passing it as a parameter to
the role like so:

```yaml
---
- hosts: insa_synapse
  roles:
    - { role: '{{playbook_dir}}/roles/install_synapse'}
```

License
-------

Licensed under the [MIT license](http://mit-license.org/vitalk).

Author Information
------------------

Created by Mohsen Abbasi.

Don't hesitate create [an Issue](https://github.com/devopsy-ir/devops-tools/issues) if you have any bugs or suggestions.
