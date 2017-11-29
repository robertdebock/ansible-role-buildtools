buildtools
=========

[![Build Status](https://travis-ci.org/robertdebock/ansible-role-buildtools.svg?branch=master)](https://travis-ci.org/robertdebock/ansible-role-buildtools)

Install buildtools for your system.

Requirements
------------

Access to a repository containing packages, likely on the internet.

Role Variables
--------------

None known.

Dependencies
------------

- robertdebock.bootstrap

Download the dependencies by issuing this command:
```
ansible-galaxy install --role-file requirements.yml
```

Example Playbook
----------------

```
---
- hosts: servers
  become: yes

  roles:
    - robertdebock.buildtools

  tasks:
    - name: make something
      make:
        chdir: /my/project
        target: install
      become: yes
```

Install this role using `galaxy install robertdebock.buildtools`.

License
-------

Apache License, Version 2.0

Author Information
------------------

Robert de Bock <robert@meinit.nl>
