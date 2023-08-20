controlplane
=========

This role configures control plane nodes on RKE2 cluster.

Requirements
------------

At least one EC2 Linux instance (Debian/Ubuntu).

Role Variables
--------------

_defaults/main.yml_
```yaml
# verify kubectl documentation to make sure urls are up to date, overwrite if needed
kubernetes_apt_key_url: "https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key"
kubernetes_apt_key_folder: "/etc/apt/keyrings"
kubernetes_apt_key_filename: "kubernetes-apt-keyring.gpg"
kubernetes_apt_source: "https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /"
```

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: controlplane
      roles:
         - controlplane

License
-------

BSD

Author Information
------------------

piotr.swiecik@gmail.com / capricorndev.pl
