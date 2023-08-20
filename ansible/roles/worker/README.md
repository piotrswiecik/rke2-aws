worker
=========

This role configures worker nodes on RKE2 cluster.

Requirements
------------

At least one EC2 Linux instance (Debian/Ubuntu).

Role Variables
--------------

_defaults/main.yml_
```yaml
# verify RKE2 website & make sure to use current url
rke2_install_script_url: "https://get.rke2.io"
```

_vars/main.yml_
```yaml
# rke node token must be provided in some way - passed to this role from outside
rke2_node_token: insert_token_here
```

Dependencies
------------

None.

Example Playbook
----------------

```yaml
---
- hosts: controlplane
  become: true

  roles:
    - role: controlplane
      tags: controlplane

- hosts: workers
  become: true

  roles:
    - role: workers
      tags: workers
```

License
-------

BSD

Author Information
------------------

piotr.swiecik@gmail.com / capricorndev.pl
