![](https://raw.githubusercontent.com/xhilmi/xhilmi/master/image.png)

1. Install Ansible
```
bash <(curl -s https://raw.githubusercontent.com/xhilmi/ansible/master/install.sh)
```

2. Setup file `ansible.cfg` and `hosts`
### save into $HOME for `user`
### save into /etc/ansible/ for `root`
```
ansible-config init --disabled -t all > ansible.cfg
```
```
[master-node]
38.1.1.1
38.2.2.2
38.3.3.3

[worker-node]
34.1.1.1
34.2.2.2
34.3.3.3

[kubernetes:children]
master-node
worker-node
```

3. On your local machine run ssh-copy-id
```
ssh-copy-id user@38.1.1.1
ssh-copy-id user@38.2.2.2
ssh-copy-id user@38.3.3.3
ssh-copy-id user@34.1.1.1
ssh-copy-id user@34.2.2.2
ssh-copy-id user@34.3.3.3
```

4. Test ansible connection
```
ansible -i hosts all -m ping
ansible -i hosts master-node -m ping
ansible -i hosts worker-node -m ping
ansible -i hosts kubernetes -m ping
```

