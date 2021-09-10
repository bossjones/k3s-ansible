site:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini site.yml

provision:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini provision.yml

reset:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini reset.yml

download:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini download.yml

ping:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini ping.yml

node:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini node.yml
node-download:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini node-download.yml

debug:
# Get k3s server logs
	sudo systemctl status k3s

# Save logs into a file
	sudo journalctl -u k3s > logs.txt
