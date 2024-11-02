# ansible user 

based on : https://github.com/rlaager/ansible-bootstrap

TLDR:
apt install pip python3 pipx
pipx install ansible-core
ansible-galaxy collection install ansible.posix


put the ssh pub key at the root directory and use  this var :

```yaml
- name: Create ansible's authorized_keys
  become: yes
  become_user: root
  authorized_key:
    user: ansible
    path: /home/ansible/.ssh/authorized_keys
    key: "{{ lookup('file', 'id_rsa.pub') }}"
    exclusive: yes

```
## Usage

If the system already has a user named `ansible` with sudo access and a
known password:
```
  ansible-playbook bootstrap.yaml \
    -e target=EXAMPLE.DOMAIN --ask-pass --ask-become-pass
```

If you wish to use a different user, specify it with `-u`:
```
  ansible-playbook bootstrap.yaml -u USERNAME \
    -e target=EXAMPLE.DOMAIN --ask-pass --ask-become-pass
```

If you wish to use a different user and have SSH key-based access, omit
`--ask-pass`:
```
  ansible-playbook bootstrap.yaml -u USERNAME \
    -e target=EXAMPLE.DOMAIN --ask-become-pass
```

If the system does not have sudo installed (e.g. Debian 10 out of the box),
but you have a user which can use SSH _and_ have a root password, specify a
`become_method` of `su` and, when prompted, specify the root password as the
become password (which may be different from the SSH user's password):
```
  ANSIBLE_BECOME_METHOD=su ansible-playbook bootstrap.yaml \
    -u USERNAME -e target=EXAMPLE.DOMAIN --ask-pass --ask-become-pass
```
