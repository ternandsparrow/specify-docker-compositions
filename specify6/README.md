This Dockerfile is used for creating specify6-service images for use with in Specify 7 docker compositions.

Build the image, replacing the versions as appropriate:
```
docker build -t specifyconsortium/specify6-service:6.8.03 --build-arg version=6803 --platform linux/amd64 .
```

Push the image:
```
docker push specifyconsortium/specify6-service:6.8.02
```
