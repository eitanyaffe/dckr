# dr: A docker wrapper

This helper script generates and calls a tailored docker command. It
customizes the command with a user-specified image, mounts
a set of user-defined volumes, and calls a user-specified command within the
container. 

dr has two workflows. The ```run``` command
spins up a container, executes a command, and destorys the container upon completion. The ```up/down/execute```
workflow is designed for cases where we wish to avoid the overhead of
creating and destroying containers. Here the the user first spins up a
container with a user-speficied key using the ```up``` command, calls
multiple commands using th ```execute``` command, and can destroy the container
using the ```down``` command.

## Syntax
```
Usage: dr <command> [-p <profile>] [-i <image>] [-n <name>] [-k <key>] <container_commands>
Commands:
  run: Run a container command on an docker image
  up: Create a singleton container and associate with a key
  down: Remove a singleton container associated with a key
  exec: Execute commands on singleton container associated with key
  ps: Show all running containers
Options:
  -i <image>: Docker image
  -p <file>: Profile (default: '/etc/docker/profiles/dr_base')
  -k <key>: Singleton key (Required for up/down/exec commands)
  -n <name>: Specify container name for non-singlton container (default: none)
  -d: Print command line without executing (dry run)
```

## Installation

1. Run ```sudo make install```.

2. Add ```/etc/docker/tools``` to your path.

3. Add to the end of /etc/sudoers this line:
``ALL	ALL=(ALL) NOPASSWD: /usr/bin/dr```

## Profiles

The volumes mounted by docker and other docker parameters are defined
using the profile parameter. The default profile is ```/etc/docker/profiles/dr_base```, which contains:
```
DOCKER_RUN_USER_OPTS="-v /relman01:/relman01 -v /relman02:/relman02 -v /relman03:/relman03 -v /relman04:/relman04 -v /home:/home"
```

## dr commands

### The execute command

1. Start a container running R
```sudo dr up -k R -h -i eitanyaffe/r-relman```

2. Execute the script x.r with the R container.
```sudo dr exec -k R Rscript x.r```

3. Bring down the R container.
```sudo dr down -k R```

### The run command

Execute the bash script x.sh within an ubuntu container:
```sudo dr run -i ubuntu x.sh```

## Tools

The ```/etc/docker/tools``` contains bash scripts that serve as
aliases for dr commands. See files there.
