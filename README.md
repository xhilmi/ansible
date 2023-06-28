![](https://raw.githubusercontent.com/xhilmi/xhilmi/master/image.png)

1. Install Ansible
```
bash <(curl -s https://raw.githubusercontent.com/xhilmi/ansible/master/install.sh)
```

2. Setup file `ansible.cfg` and `hosts`
- save into $HOME for `user`
- save into /etc/ansible/ for `root`
```
ansible-config init --disabled -t all > ansible.cfg
```
```
[master_node]
38.1.1.1

[worker_node_a]
38.2.2.2

[worker_node_b]
38.3.3.3

[kubernetes:children]
master_node
worker_node

[worker_node:children]
worker_node_a
worker_node_b
```

3. On your local machine run ssh-copy-id
```
ssh-copy-id user@38.1.1.1
ssh-copy-id user@38.2.2.2
ssh-copy-id user@38.3.3.3
```

4. Test ansible connection
![image](https://github.com/xhilmi/ansible/assets/38133643/66cb8abb-49c1-46f8-bde6-7ca7ca67b599)
```
ansible -i hosts all -m ping
ansible -i hosts master-node -m ping
ansible -i hosts worker-node -m ping
ansible -i hosts kubernetes -m ping
```

