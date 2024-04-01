# Laravel Boilerplate using docker and push Registry

[![license](https://img.shields.io/github/license/dec0dOS/amazing-github-template.svg?style=flat-square)](LICENSE)

<details open="open">
<summary>Table of Contents</summary>
  
- [About](#about)
- [Installation](#installation)
- [Additional action](#additional-action)
    - [Setting registry](#setting-registry)
- [Registrymy](Registrymy)
    - [Installation registrymy](#installation-registrymy)
    - [Description of the bash script](#description-of-the-bash-script)
    - [Launch of the project](#launch-of-the-project)
    - [Check](#check)
- [Push to the Registry auto](#push-to-the-registry-auto)
- [License](#license)
  
</details>


## About
The project is based on [Laravel Boilerplate](https://github.com/rappasoft/laravel-boilerplate?tab=readme-ov-file). Deployment of this project is automated using docker containers. 
Four docker containers are used:
- php
- node
- nginx
- mysql

## Installation

Download the project, be sure to use the --recurse-submodules flag to download the added submodule.
```sh
git clone --recurse-submodules https://github.com/Bogi25/gitLocal-DH.git
```
Enter the project folder and run Docker Compose:
```sh
cd gitA-DH
docker compose up
```
## Additional action
Automatic push to Registry added through Git Runner.

### Setting registry
Add the Git Runner in GitHub Settings > Actions > Runners > new self-hosted runner with the standard instructions and run:

```sh
./run.sh
```

In the project, a single Docker image is built, so prepare a repository on the local Registry:

_<DOCKER_USERNAME_LOCAL>/php-composer_

This is implemented using the project <strong>[registryme](https://github.com/Bogi25/registryme).</strong> The project is added as a submodule in the registrymy folder.

## Registrymy
<details open> <summary> Detailed description</summary>

### Installation registrymy
Run a bash script in the folder with the project start-setting.sh :
```sh
cd registryme
./start-setting.sh 
```
### Description of the bash script
That's what this bash script does:

<table>
<tr>
<td>
<strong>Importantly.</strong> Some commands require administrator rights.

--- 
1. Adds a record 127.0.0.1 registry.local в /etc/hosts.
<details open>
<summary>2. Creates all necessary folders</summary>

- _data-registrymy_
- _security-settings/auth_
- _security-settings/certs_
- _/etc/docker/certs.d/registry.local_
- _/home/$username/.docker_

</details>

3. Records and encrypts login and password using htpasswd, DOCKER_USERNAME_LOCAL and DOCKER_PASSWORD_LOCAL secrets added to GitHub.
4. Creates a self-signed certificate and adds it to docker to trust them.
5. The script will interactively prompt for two parameters:

- Login, which is your `DOCKER_USERNAME_LOCAL` added as a secret in GitHub.
- Password, which is your password added as a secret `DOCKER_PASSWORD_LOCAL` in GitHub.

6. Docker restarts
7. RUN _docker compose up -d_

<details open>
<summary>List of commands that need sudo:</summary>

- sudo tee -a /etc/hosts
- sudo mkdir -p /etc/docker/certs.d/registry.local
- sudo ln -s /etc/docker/certs.d/registry.local/registry.local.crt $users/.docker/ca.pem
- sudo systemctl restart docker

</details>
</td>
</tr>
</table>

### Launch of the project
```sh
docker compose up
```
### Check
Link to check
```sh
https://registry.local:5000/v2/_catalog
```
</details>

## Push to the Registry auto

To push to the local Registry, secrets `DOCKER_USERNAME_LOCAL` and `DOCKER_PASSWORD_LOCAL`, which were added to GitHub, are used.
The description is located in the file .github/workflows/push-local-dh.yml
Docker images are sent to the address:

_registry.local:5000 (php-composer)_

When executing the `git push` command to the repository, images will be automatically pushed to the local Registry. The build will be performed by Git Runner.

---
Also, to view all pushed commits, use the command:

<details open>
<summary>Also, the command to log in is:</summary>

```sh
docker login registry.local:5000
```
</details>

```sh
docker image ls registry.local:5000/php-composer
```

## License
This project is licensed under the MIT license. Feel free to edit and distribute this template as you like.

See [LICENSE](LICENSE) for more information.
