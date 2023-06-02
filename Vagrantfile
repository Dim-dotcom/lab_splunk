Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"


  config.vm.define "search_head" do |machine|
    ## met la machine dans un réseau privé et lui assigne l'addresse 192.168.33.10
    machine.vm.network "private_network", ip: "192.168.33.10"

    ## cette ligne indique à vagrant un script à éxecuter sur la VM lors du provisionnement
    machine.vm.provision "shell", path: "search_head_bootstrap.sh"

    ## cette ligne vous fournit un dossier synchronisé entre la machine hote et la VM
    machine.vm.synced_folder "./search_head_data", "/home/vagrant/search_head_data"
    
    ## redirection de ports afin d'accéder à l'interface web splunk sur le splunk head
    machine.vm.network "forwarded_port", guest: 8000, host: 8001
    ## cette ligne utilise virtualbox pour configurer la mémoire de la VM. 
    machine.vm.provider "virtualbox" do |m|
      m.memory = 12000
    end

  end


  config.vm.define "indexer" do |machine|
    machine.vm.network "private_network", ip: "192.168.33.11"
    machine.vm.provision "shell", path: "indexer_bootstrap.sh"
    machine.vm.synced_folder "./indexer_data", "/home/vagrant/indexer_data"

    machine.vm.provider "virtualbox" do |m|
      m.memory = 12000
    end
  end

  config.vm.define "universal_forwarder" do |machine|
    machine.vm.network "private_network", ip: "192.168.33.12"
    machine.vm.provision "shell", path: "universal_forwarder_bootstrap.sh"
    machine.vm.synced_folder "./universal_forwarder_data", "/home/vagrant/universal_forwarder_data"
    
    ## forwarding pour accéder au serveur apache
    machine.vm.network "forwarded_port", guest: 80, host: 8081
    
    machine.vm.provider "virtualbox" do |m|
      m.memory = 2048 ## ici la mémoire est inférieure aux deux autres machines car l'universal forwarder demande moins de ressources que l'indexer et le search head
    end
  end
end