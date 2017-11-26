# My Docker Traefik configuration

Just to keep my Docker reverse-proxy configuration 

## Getting starting

You need to install Docker - [Install Docker](https://docs.docker.com/engine/installation/#server)

And docker-compose - [Install docker-compose](https://docs.docker.com/compose/install/#install-compose)

## Installation

Install apache2-utils package

```bash
$ sudo apt-get install -y apache2-utils
```
Generate the password with htpasswd

```bash
$ htpasswd -nb admin your_secret_password
```

Use the output to configure users in your traefik.toml file

In the same file set your email for Let's Encrypt configuration and domains you want to get certificate

Create a docker network for the proxy to share with containers

```bash
$ docker network create proxy
```

Check that network was created

```bash
$ docker network ls
```

We will add others containers to this network to be proxied

Create an empty file named *acme.json*

```bash
$ touch acme.json
```
And fix the permission to this file so only root user can read and write this file. 

```bash
$ chmod 600 acme.json
```

Then you can run "startProxy.sh" script

```bash
$ ./startProxy.sh
```
You will be prompted to fill a domain name. This domain will be used to access your Traefik dashboard from your browser 

It's done your Traefik reverse-proxy is working. You can add docker containers to Traefik 

## Warnings

To be able to use labels in docker-compose.yml file you need to get the 1.16.1 docker-compose version (https://stackoverflow.com/questions/47094460/docker-compose-having-problems-with-labels)

In order to clone your project you should choose another port than 22. If you have a firewall, allow the chosen port and let the Gitlab container redirect it to port 22. (Ex: 0.0.0.0:2222 -> 22/tcp)

The clone command then will be a little different. Here's an example: 

```bash 
$ git clone ssh://git@git.domain.com:<port>/<team>/<project>
```

## Tutorials

* **DigitalOcean** - *How to Use Traefik as a Reverse Proxy for Docker Containers on Ubuntu 16.04* - [Tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-traefik-as-a-reverse-proxy-for-docker-containers-on-ubuntu-16-04)
* **bardina.net** - *Utilisation de Traefik pour Portainer et Gitlab* - [Tutorial](https://www.bardina.net/traefik-gitlab-docker/)

## Authors

* **Théo Herveux** - *Initial work* - [MyGit](https://github.com/Hurobaki)
