# GITVERSION-ASPNETCORE-BUILD

## Usage

```bash
docker run -v $(PWD):/src -w="/src" franklin89/gitversion-aspnetcore-build /bin/bash -c "./build.sh"
```

### Using a compose file

```bash
docker-compose -f docker-compose.ci-build.yml up ci-build
```

Make sure that the 'build.sh' file is maked as an executeable.

```bash
chmod +x build.sh
```
