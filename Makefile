site:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini site.yml


provision:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini provision.yml

reset:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini reset.yml

download:
	ansible-playbook -vvvv -i inventory/my-cluster/hosts.ini download.yml
