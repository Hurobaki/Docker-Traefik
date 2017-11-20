# My Docker Traefik configure

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

Then you can run "startProxy.sh" script

```bash
$ ./startProxy.sh
```

## Warnings

To be able to use labels in docker-compose.yml file you need to get the 1.16.1 docker-compose version

## Authors

* **Théo Herveux** - *Initial work* - [MyGit](https://github.com/Hurobaki)
