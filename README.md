# Build TMK in Docker

## Step

1. `docker build -t build-tmk:latest .`
2. `docker run --name build-tmk -v ${PWD}:/output build-tmk:latest`
3. Then, you get the hex firmware in the current directory.