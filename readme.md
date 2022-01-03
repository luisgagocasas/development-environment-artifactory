# Development environment Artifactory

Use this repository in development environment.

## Vagrant Artifactory
The purpose is to recreate an Artifactory production environment using a public ip.


## Technologies

- Vagrant + (VirtualBox)
- Artifactory (jfrog)

## Command

- vagrant validate
- vagrant up
- vagrant destroy -f
- vagrant status
- vagrant ssh master
- vagrant ssh -c "ls -ls" 2>/dev/null
- vagrant suspend master (Pause VM)
- vagrant resume master (Reactive vm)

## Variable important (Vagrantfile)
- VM_IP (IP base)

## Artifactory project
- http://192.168.1.200:8081/artifactory


## By

- Luis Gago Casas (https://luisgagocasas.com)