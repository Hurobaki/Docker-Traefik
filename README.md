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
$ docker network create <span style="color:red"> proxy </span>
```

Check that network was created

```bash
$ docker network ls
```

We will add others containers to this network to be proxied

Then you can run "startProxy.sh" script

```bash
$ ./startProxy.sh
```
You will be prompted to fill a domain name. This domain will be used to access your Traefik dashboard from your browser 

It's done your Traefik reverse-proxy is working 

## Warnings

To be able to use labels in docker-compose.yml file you need to get the 1.16.1 docker-compose version

## Authors

* **Théo Herveux** - *Initial work* - [MyGit](https://github.com/Hurobaki)
