
# My-WebTOP

![](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/webtop-logo.png)
## Objet


Ceci est un environnement de developpement simple dans un container.
Je me suis basé sur l'image https://docs.linuxserver.io/images/docker-webtop#versions

J'y est ajouté:
* Vscode
* ansible,
* terraform
* kubectl
* k9s
* [kubeswitch](https://github.com/danielfoehrKn/kubeswitch)
* 

## Prérequits

Se projet est dédié a un environnement poste de travail sous Windows avec Docker Engine Desktop installé de base.

Voici les prérequis matériel minimal:
* 16Go de RAM (32Go c'est mieux)
* Intel Processor compatible avec la virtualisation et activé dans le BIOS
* Au moins 50Go d'espace disque disponible.

## Lancement

```bash
git clone https://github.com/kumalabsconsulting/mywebtop.gi
cd mywebtop
docker compose up -d
```

## Fonctionnement
Au chargement du container, l'installation est lancé par le s6-rc.
Plus il y aura de custom-init, plus se sera long.

