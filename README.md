# docker-jupyter-ansible
Here is my docker image to run ansible and jupyter internally.

## How to build
You can build the docker image simply via [Dockerfile](./Dockerfile).
```shell
cd docker-jupyter-ansible
docker build -t jupyter-ansible .
```

## How to use
Please run `docker run` command and you will see output from [entrypoint.sh](./entrypoint.sh).
```shell
$ docker run --name test -p 8889:8888 jupyter-ansible
ansible-playbook 2.9.10
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.6/dist-packages/ansible
  executable location = /usr/local/bin/ansible-playbook
  python version = 3.6.9 (default, Apr 18 2020, 01:56:04) [GCC 8.4.0]
docker-jupyter-ansible $ 
```