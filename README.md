Simple docker reverse proxy for local development on multiple projects

# How to use

Execute `docker-compose up -d` to start the containers.

It will restart after reboot, because of the restart policy of `unless-stopped`

If you want to, there is a `setup.sh` script, that adds hostnames to `/etc/hosts`.
You can define the hostnames in a file `config/custom`. The default file should usually not be altered.
