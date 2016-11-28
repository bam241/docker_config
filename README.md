=============
DOCKER CONFIG
=============

Suppose to host Dockerfile to fire quickly docker image

usefull tips:

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

- *re- mane/tag it*
```
docker docker tag old-name/old-tag new-name/new-tag
```

- *push it - require login*
```
docker push name-tag
```

- *normal work process"
```
cd where_dockerfile_is
docker build -t baaaaam/container_name .
docker push baaaaam/container_name
docker run -r -i baaaaam/container_name
```


- *note for later*
```
-no-cache is currently bool, so this simply extends the existing behaviour.

docker build --no-cache - same behaviour as before: ignores cache
docker build --no-cache someRegex - ignores any RUN or ADD commands that match
someRegex
```
