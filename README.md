=============
DOCKER CONFIG
=============


Suppose to host Dockerfile to fire quickly docker image


usefull tips:
<<<<<<< HEAD

- *launch image - do stuff - exit - sset container name*
```
docker run -i -t ubuntu:14.04 /bin/bash
[...]
exit
docker ps -a
docker commit <container_id> new_image:tag_name
```

- *build img + mane/tag it*
```
docker build -t name/tag .
```

- *re- mane/tag it *
```
docker docker tag old-name/old-tag new-name/new-tag
```

- *push it - require login*
```
docker push name-tag
```

