This is a slightly different build than the main branch which adds support for resolving multiple handles using one server. The majority of the instructions outlined in the [README.md in the main branch](https://github.com/jameswsullivan/docker-dspace-handle-server/blob/main/README.md) still apply, with the following changes to the build args:


```
PREFIXES_ADMINS="\"300:0.NA/1234.5\",\"300:0.NA/2345.6\""
HANDLE_PREFIXES="\"0.NA/1234.5\",\"0.NA/2345.6\""
DSPACE_SERVER_URLS="dspace.handle.endpoint1 = https://my-dspace-url1.com/server\ndspace.handle.endpoint2 = https://my-dspace-url2.com/server"
```


More handles and DSpace server URLs can be added following the same format.
