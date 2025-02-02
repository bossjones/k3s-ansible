#!/usr/bin/env bash

# note this is for lab1
sudo tee /etc/netplan/00-installer-config.yaml >/dev/null << EOF
network:
  ethernets:
    ens33:
      addresses: [192.168.1.67/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
  version: 2
EOF

echo 'defaults {' | sudo tee /etc/multipath.conf
echo '    user_friendly_names yes' | sudo tee -a /etc/multipath.conf
echo '} ' | sudo tee -a /etc/multipath.conf
echo 'blacklist {' | sudo tee -a /etc/multipath.conf
echo '    devnode "^(ram|raw|loop|fd|md|dm-|sr|scd|st|sd|mmc|nvme)[a-z0-9]*"' | sudo tee -a /etc/multipath.conf
# SOURCE: https://sleeplessbeastie.eu/2021/01/06/how-to-fix-multipath-daemon-error-about-missing-path-when-using-virtualbox/
echo '  device {' | sudo tee -a /etc/multipath.conf
echo '    vendor "VMware,"' | sudo tee -a /etc/multipath.conf
echo '    product "VMware Virtual S"' | sudo tee -a /etc/multipath.conf
echo '  }' | sudo tee -a /etc/multipath.conf

echo '    devnode "^(ram|raw|loop|fd|md|dm-|sr|scd|st|sd|mmc|nvme)[a-z0-9]*"' | sudo tee -a /etc/multipath.conf
echo '}' | sudo tee -a /etc/multipath.conf

echo "-------------------------------------------"
echo "printing: sudo cat /etc/multipath.conf"
echo "-------------------------------------------"
sudo cat /etc/multipath.conf


echo "network: {config: disabled}" | tee /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
sudo netplan apply
sudo systemctl restart multipathd.service


sudo apt-get remove --purge -y kubeadm kubelet kubectl kubernetes-cni || true
sudo apt-get install mlocate -y
sudo apt autoremove -y
sudo updatedb
sudo mlocate kubelet
