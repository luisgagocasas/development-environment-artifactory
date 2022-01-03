# Variables
VM_IP = "192.168.1.20"

# Parse variables command line
options = {}
options[:bridge] = ARGV[1] || "wlp0s20f3"

Vagrant.configure("2") do |config|
  # VM Master
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.box = "ubuntu/focal64"
    master.vm.box_version = "20211026.0.0"
    master.vm.box_check_update = false
    master.vm.provision:shell, inline: <<-SHELL
      echo "root:rootroot" | sudo chpasswd
      sudo timedatectl set-timezone America/Lima
    SHELL
    master.vm.network :public_network, bridge: options[:bridge], ip: "#{VM_IP}0"
    master.vm.provision :shell, inline: "apt-get update"
    master.vm.provision :shell, path: "master.sh"
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 3024
    v.cpus = 4
  end

  config.trigger.after :up do |trigger|
    trigger.info = "Finish run process!!"
    trigger.run_remote = { path: "summary.sh", args: [VM_IP] }
  end
end