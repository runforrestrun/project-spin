## Introduction
This study project is about 
- running a Laravel application with the best PHP docker image possible.
- and having it set up in the most easy way for **all** environments
- with zero downtime 

It seems [Spin](https://github.com/serversideup/spin) is the only qualified candidate for this job.

## Project Purpose
Educational purpose project, learn what tools and technologies are used by [Spin](https://github.com/serversideup/spin).

## Takeaways
- Have SSH key in place to automatically logon server 
  - Create a SSH keypair with modern ```ed25519``` algorithm
  - On MacOS, if ```~/.ssh/id_ed25519``` exists, it will autoselect. Thus ```ssh root@server.com``` works automatically without need to use ```-i id_ed25519```
- Configure ```.spin.yml```
  - use one SSH keypair for the user 'deploy'
  - use another SSH keypair for the additional user
  - create a default password using python script which user needs to change upon first SSH logon 
  - Configure ```.spin.inventory```
  - Change email adress in ```.infrastructure/conf/traefik/prod/traefik.yml``` 
  - Specify for ```DB_HOST=mariadb```, localhost or 127.0.0.1 doesn't work because mariadb is inside another container
- Execute ```spin provision``` 
  - Give time for DNS propagation, otherwise runner can't SSH into server: permission denied.
  - Notice that ```spin provision``` removes root access after provisioning the server
  - Ensure 2nd user in ```.spin.yml``` is properly defined with password and SSH key.
  - After ```spin provision``` is done and without errors, logon with 2nd user and set password.

## Misc
Delete all containers and images:
```docker container rm $(docker container ls -aq) -f```

