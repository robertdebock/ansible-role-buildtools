buildtools
=========

[![Build Status](https://travis-ci.org/robertdebock/ansible-role-buildtools.svg?branch=master)](https://travis-ci.org/robertdebock/ansible-role-buildtools)

Install buildtools for your system.

Context
--------
This role is a part of many compatible roles. Have a look at [the documentation of these roles](https://robertdebock.nl/) for further information.

Here is an overview of related roles:
![dependencies](https://raw.githubusercontent.com/robertdebock/robertdebock.github.io/artifacts/buildtools.png "Dependency")

Requirements
------------

Access to a repository containing packages, likely on the internet.

Role Variables
--------------

None known.

Dependencies
------------

You may use this role to prepare your system:

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
    - robertdebock.bootstrap
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
