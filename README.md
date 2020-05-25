# kubernetes

#### Update [2020/05/16] virtualbox 6.1.8 host edition resolves VboxClient --display compatibility issue

the latest version 6.1.8 resolves the host  VboxClient --display compatibility issue reported on 

~~https://www.virtualbox.org/ticket/19590

#### Update [2020/05/16] virtualbox 6.1.6 host edition compatibility issue
https://www.virtualbox.org/ticket/19590

On the latest version 6.1.6 of virtualbox , the virtuabox guest edition is broken, this causes VBOXClient --display to fail, so if that is your issue please downgrade back to previous version of virtualbox and install a compatible virtualbox guest edition.
to install guest edition using plugin  - run `vagrant plugin vbguest` and add this line `config.vbguest.auto_update = true` to your vagrant file.

#### Using the Vagrant file - ensure you already have virtualbox and vagrant installed

This vagrant file builds kubernetes single node cluster using 'Minikube' for playing with kubernetes features. but when i am on ofice vpn, the network trffic coming out of vm is blocked,  it blocks me.

Note: The original author of  centos+minikube Vagrantfile is `mrvantage`, i have only extended it by adding vnc to use GUI when i need .

#### Why another vagrant file ?

Most of the time we work on vpn and off vpn and this switching of network often causes vagrant vm to go unstable and require troubleshooting, also when we are on vpn we cant do stuff like access  network traffic coming out of vm.

#### How does adding vnc help ?

We can access  gui  on vm,  for example once we install a web based app container inside the pod and want to see the output, all we have to do is `open vnc://localhost:5901` & provide `password` as `password` when prompted on mac ( or install whatever vnc lient you like ) and launch web browser to access it.

### How to use
* install vagrant and virtual boox
* download this repo
* `cd kubernetes`
* `chmod 755 *.sh && ./call_vagrant.sh`
* sit back and relax, the first run takes about 8 to 12 mins depending upon your network speed.
