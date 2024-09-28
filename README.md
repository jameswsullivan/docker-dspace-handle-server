## Docker Containerized Standalone DSpace Handle Server

#### About

This is a docker containerized version of a standalone handle server (Handle.Net Registry) for DSpace (7.4 and later). The build/installation process is largely the same as [To install a Handle resolver on a separate machine](https://wiki.lyrasis.org/display/DSDOC7x/Handle.Net+Registry+Support#Handle.NetRegistrySupport-ToinstallaHandleresolveronaseparatemachine), with minor customizations for easy configuration using build args and environment variables.

#### Instructions

- Configure the following on your DSpace backend API:

```
# If use environment variable:
handle__P__remote__D__resolver__P__enabled = true
handle__P__hide__P__listhandles = false

# If use dspace config files:
handle.remote-resolver.enabled = true
handle.hide.listhandles = false
```

- Make a copy of the `example.env` file and name it `.env`, and fill out the info that fits your environment.

- Build the image or run with docker compose :

```
docker compose build

# or

BUILDKIT_PROGRESS=plain docker compose build --no-cache dspace-handle-server 2>&1 | tee dspace-handle-server-build.log

# or run with :

docker compose up -d
```

- After the server starts, observe the container logs for errors, view the port bindings and perform test handle resolution using the following commands (replace the handle with a valid one):

```
netstat -tulnp

curl -i http://localhost:8000/1234.5/123456
```

- Logs are saved and persisted under the `/hs/svr_1/logs` path.

- The following environment variables can be supplied at runtime for easy configuration and portability. The `/hs/svr_1/config.dct` file is not persisted and will be modified by `entrypoint.sh` upon container startup using the environment variables.

```
BIND_IP
HTTP_PORT
LOG_ACCESS
TCP_UDP_PORT
HANDLE_PREFIX
LOG_ROTATION_FREQUENCY_LONG
DSPACE_SERVER_URL
JAVA_OPTS
```


#### The current version is `9.3.1` downloaded from [handle.net](https://www.handle.net/) .