## Testing Out Project Spin

Educational purpose to investigate and learn how[ Project Spin works](https://github.com/serversideup/spin)

- 
- Laravel Deployment with zero downtime 
- 100% Environment Replication
- Graceful connection draining

## Learning Points
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

