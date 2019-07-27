---
categories:
  - "code"
date: "2016-11-01T19:40:37+01:00"
title: "Ansible Vault password in pass"
tags:
  - "ansible"
  - "pass"
  - "helper"
  - "gist"
  - "python"
draft: false
slug: ansible-vault-pass
aliases:
  - /code/ansible-vault-pass/
---

**Note:**
As Ansible progressed it may be better to use ansible-vault id for his purpose.

Small helper script for usage with ansible-vault and ansible-playbook together with
[pass](https://www.passwordstore.org/) Two implementations: first in bash and another
one in python, which should be better as the git config hack to get ini files may fail
due to incompatibilities in git vs. ansible ini style. The bash version is kept for reference.

## Code

{{<gist u="toke" id="ebc49b7dd08d7b87e23921029176d3f5" >}}
