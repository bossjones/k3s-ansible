site:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini site.yml

provision:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini provision.yml

reset:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini reset.yml

download:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini download.yml

ping:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini ping.yml

node:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini node.yml
node-download:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini node-download.yml

debug:
# Get k3s server logs
	sudo systemctl status k3s

# Save logs into a file
	sudo journalctl -u k3s > logs.txt

gpr:
	git pull --rebase
