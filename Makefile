site:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini site.yml

provision:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini provision.yml

reset:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini reset.yml

reset-master:
	ansible-playbook -vvv -i inventory/my-cluster/hosts.ini reset-master.yml

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

check-tls:
	bash ./hacking/check_tls.sh
	echo ""
	date

clean-master: reset-master
	sudo systemctl stop k3s || true
	./hacking/k3s-killall.sh
