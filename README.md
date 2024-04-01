## Testing Out Project Spin

Educational purpose to investigate and learn how[ Project Spin works](https://github.com/serversideup/spin)

- 
- Laravel Deployment with zero downtime 
- 100% Environment Replication
- Graceful connection draining

## Learning Points
- Ensure you can logon with SSH into remote server by having pub key registered
  - Use SSH keypair with modern ```ed25519``` algorithm
  - On MacOS, if ```~/.ssh/id_ed25519``` exists, it will autoselect. Thus ```ssh root@server.com``` works automatically without need to use ```-i id_ed25519```
- Configure ```.spin.yml```
  - use one SSH keypair for the user 'deploy'
  - use another SSH keypair for the additional user
  - create a default password using python script which user needs to change upon first SSH logon 
- configure ```.spin.inventory```
- configure Traefik and specify email address
- Specify for ```DB_HOST=mariadb```, localhost or 127.0.0.1 doesn't work because of docker network 
- Use ```spin provision``` after everything is configured.
- Give time to have DNS propagation worked out. or agents/runners, can't SSH into server.
- ```spin provision``` removes root access after provisioning the server
  - Ensure 2nd user in .spin.yml is properly defined, configured and has pub SSH key/
  - After ```spin provision``` is done and without errors, logon with 2nd user and set password.

## Misc

Delete all containers and images:

```docker container rm $(docker container ls -aq) -f```

