## About Project Spin

- Laravel Deployment with zero downtime 
- 100% Environment Replication
- Graceful connection draining

## Learning Points
- Ensure you can logon with SSH into remote server by having pub key registered
  - use SSH keypair with modern ```ed25519``` algorithm
  - autodetect and use if ```~/.ssh/id_ed25519 exists```
- Configure ```.spin.yml```
  - use one SSH keypair for the user 'deploy'
  - use another SSH keypair for the additional user
  - create password using pip3 
- configure ```.spin.inventory```
- configure Traefik and specify email address
- Specify for ```DB_HOST=mariadb```, localhost or 127.0.0.1 doesn't work because of docker network 
- Use ```spin provision``` after everything is configured.
- Give time to have DNS propagation worked out. or agents/runners, can't SSH into server.

## Misc

Delete all containers and images:

```docker container rm $(docker container ls -aq) -f```

