# vagrant-ubuntu-19.10-dev

Vagrant/VirtualBox configuration to build an Ubuntu Desktop 19.10 (Eoan Ermine) for development

It's based on the box [jcaraballo/ubuntu-desktop-eoan](https://app.vagrantup.com/jcaraballo/boxes/ubuntu-desktop-eoan),
created as described in [its GitHub project](https://github.com/jcaraballo/vagrant-box-ubuntu-desktop-eoan)

## Requirements

* [Vagrant](https://www.vagrantup.com/downloads.html)
```
wget https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb
sudo dpkg -i vagrant_2.2.6_x86_64.deb
```

* [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
```
echo deb http://download.virtualbox.org/virtualbox/debian $( lsb_release -cs ) contrib | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y virtualbox-6.0 dkms
```

* VirtualBox Extension Pack
  - Download the [VirtualBox 6.0.14 Oracle VM VirtualBox Extension Pack](https://download.virtualbox.org/virtualbox/6.0.14/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack) from the VirtualBox site
  - Install from the VirtualBox Manager or simply double click on the extension package file

## Usage

### Pre-installation

### Clone this repository
E.g.:
```
git clone https://github.com/jcaraballo/vagrant-ubuntu-19.10-dev.git
```

### Make it your current directory
E.g. after the step above:
```
cd vagrant-ubuntu-19.10-dev
```

#### Download Java

Download Java. E.g. [jdk-13.0.1_linux-x64_bin.tar.gz](https://www.oracle.com/technetwork/java/javase/downloads/jdk13-downloads-5672538.html) and save it to `resources/jdk/`. For example, if you downloaded the jdk above to `~/Downloads` do:
```
mkdir -p resources/jdk
mv -i ~/Downloads/jdk-13.0.1_linux-x64_bin.tar.gz resources/jdk/
```

#### (Optional) Add ssh keys

If you want the machine to be set up with some specific ssh keys (e.g. for git)
add them to resources/ssh-keys.

For example, if you want the guest VM to use a copy of the host VM (warning: that will copy your private key) do:

```
mkdir -p resources/ssh-keys
cp -i ~/.ssh/id_rsa ~/.ssh/id_rsa.pub resources/ssh-keys/
```

If the directory is not present or the private key is not there, no ssh keys will be set up


#### (Optional) Specify name and email for git set up

Add a files containig the email and name for git to use globally to `resources/git/email` and `resources/git/name`. Otherwise, they won't be set up by vagrant but git will prompt you to set them up on its first usage.

E.g. to copy the name and email from the global git configuration of the host:
```
mkdir -p resources/git
git config --global user.email >resources/git/email
git config --global user.name  >resources/git/name
```

#### (Optional) Provide IntelliJ Idea configuration

Add the configuration directory to `resources/idea-config`

For example, to copy the configuration from a host with Idea 2019.2 we would do:
```
mkdir -p resources/idea-config
cp -iR ~/.IntelliJIdea2019.2 resources/idea-config/
```

#### (Optional) Update box

If you have previously downloaded [jcaraballo/ubuntu-desktop-eoan](https://app.vagrantup.com/jcaraballo/boxes/ubuntu-desktop-eoan) you might want to update to the latest version with
```
vagrant box update --box jcaraballo/ubuntu-desktop-eoan
```

#### (Optional) Tweak the memory and cpus
Change the memory and cpu settings in Vagrantfile to suit your host. I recommend you to select as many cpus as the host and a good chunk of your memory, but not all of it.

For example in a host with 32 Gb RAM and 8 CPUs I would assign 24 Gb RAM and 8 CPUs to the VM by changing `vb.memory` and `vb.cpus` to:
```
vb.memory = 24576
vb.cpus  = 8
```


### Create Vagrant image

Then create the vagrant image with:

```
vagrant up
```

### Post-installation

Run the post installation script as the vagrant user from a gui terminal of the guest machine:
```
/vagrant/post.bash
```

### Restart
```
vagrant reload
```
Remember that you need to **restart by running `vagrant reload` in the host** from the directory where the `Vagrantfile` is (the root of this repo) in order to restart the VM if you want vagrant to do its tweaks, including mounting `/vagrant`
