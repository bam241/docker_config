=============
DOCKER CONFIG
=============


Suppose to host Dockerfile to fire quickly docker image


usefull tips:

- *launch image - do stuff - exit - same container name*
> docker run -i -t ubuntu:14.04 /bin/bash
> [...]
> exit
> docker ps -a
> docker commit <container_id> new_image:tag_name

- * build img - tag it - push (optional)*
docker build -t cyclus/cyclus:latest .
