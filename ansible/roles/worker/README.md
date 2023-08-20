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

# controlplane ip must be provided in some way - passed to this role from outside
```

Dependencies
------------

None.

Example Playbook
----------------

```yaml
- hosts: controlplane
  become: true

  roles:
    - role: controlplane
      tags: controlplane

- hosts: controlplane, workers
  become: true

  # some parameters must be injected into worker configuration
  tasks:
    - name: acquire rke2 node token
      shell: |
        cat /var/lib/rancher/rke2/server/node-token
      register: rke2_node_token
      delegate_to: master
    - name: register rke2 node token as ansible fact for all nodes
      set_fact:
        rke2_node_token: "{{ rke2_node_token.stdout }}"

- hosts: workers
  become: true

  roles:
    - role: worker
      tags: worker
```

License
-------

BSD

Author Information
------------------

piotr.swiecik@gmail.com / capricorndev.pl
