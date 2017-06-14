# GITVERSION-ASPNETCORE-BUILD

## Usage

'docker run -v $(PWD):/src -w="/src" franklin89/gitversion-aspnetcore-build /bin/bash -c "./build.sh"'

###Using a compose file

'docker-compose -f docker-compose.ci-build.yml up ci-build'

Make sure that the 'build.sh' file is maked as an executeable.

'chmod +x build.sh'