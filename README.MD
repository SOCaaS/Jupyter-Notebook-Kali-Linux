# Jupter Notebook on Docker
This is a unified jupyter notebook running on top of docker

## The purpose of this
This is manily used for 

- Ethical Hacking
- Learning Kali Linux Tools
- Machine Learning

## Why we run docker?
The other solution would be VM.
A docker environment would be easier to mantain and use across system.

## Deployment Details
Right now, this only support docker-compose & docker build only.

It's required to run as follow localy,
```
echo <Jupyter Notebook Password> | python3 -c 'from notebook.auth import passwd;print(passwd(input()))'
```
Enter the value to .env at $JUPYTERPASSWORD

## How to run
Build the docker using docker-compose
```sh
docker-compose build
```

Run the docker using docker-compose
```sh
docker-compose up -d
```

## Mantainers
<p>
  <a href="https://github.com/ezeutno">
    <img width="50" src="https://avatars0.githubusercontent.com/u/32078894?s=460&v=4" alt="Ivan Ezechial Suratno">
  </a>
</p>