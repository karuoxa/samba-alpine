![Samba](https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Samba_logo_2010.svg/640px-Samba_logo_2010.svg.png)
## samba-alpine
*A lightweight and easy to use Samba container using s6-Overlay and Alpine Linux for use with your own smb.conf.*


## About
This docker container was made to be lightweight and easy to use with minimal configuration needed.

It has a single user which you configure when creating the container which will be a member of the "sambashare" group within the container.

You must pass an smb.conf file to the container (See the configuration example below)


## Configuration

Example smb.conf

    [global]
        workgroup = WORKGROUP
        server string = %h server (Samba, Alpine)
        log level = 0
        server role = standalone server
    
    [share]
        comment = share
        path = /mnt/share
        valid users = @sambashare
        write list = mysambauser
        create mask = 0660
        force create mode = 0660
        directory mask = 6770
        force directory mode = 6770
        force user = mysambauser
        force group = sambashare


## Usage

    docker create \
      --name=samba-alpine \
      -e SAMBAUSER=mysambauser \
      -e SAMBAPASS=mysambapass \
      -e PUID=1000 \
      -e PGID=1000 \
      -v /path/to/file/smb.conf:/etc/samba/smb.conf \
      -v /path/to/share:/mnt/share \
      --restart unless-stopped \
      karuoxa/samba-alpine


## Final Notes
I made this container primarily for my own use. A fun little project to learn more about docker and the creation of docker images.
This container is quite limited in some aspects, such as not supporting multiple users.
If you require one with more advanced options then [dperson/samba](https://hub.docker.com/r/dperson/samba) might suite you better.


## Changelog

 - Nothing yet.
