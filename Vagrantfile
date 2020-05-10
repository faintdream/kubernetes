$script = <<-SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
yum upgrade -y
yum groupinstall "Server with GUI" "Xfce" -y
yum install tigervnc-server git -y
cd /etc/systemd/system/ 
unlink vncserver@:1.service||ln -s /lib/systemd/system/vncserver@.service vncserver@:1.service  
readlink vncserver@:1.service||ln -s /lib/systemd/system/vncserver@.service vncserver@:1.service
sed -i -e 's/\<USER\>/vagrant/g' vncserver@:1.service
myuser="vagrant"
mypasswd="password"
rm -rf /home/$myuser/.vnc
mkdir /home/$myuser/.vnc
echo $mypasswd | vncpasswd -f > /home/$myuser/.vnc/passwd
chown -R $myuser:$myuser /home/$myuser/.vnc
chmod 0600 /home/$myuser/.vnc/passwd
systemctl daemon-reload
systemctl enable vncserver@:1
systemctl restart vncserver@:1
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "mrvantage/centos7-minikube"
  config.vm.network :forwarded_port, guest: 5901, host: 5901
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision "shell", inline: $script
end
