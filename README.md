# dr: A docker wrapper

This script calls docker in order to spin up a container with a user-specified image, mounting
user-defined volumes, and calling a specific container command. 

dr has two commands or flavors. The ```run``` command
destorys the container upon completion of the container command. In the ```up/down/execute```
workflow the user first spins up a container with a key (```up``` command), calls
multiple commands using th ```execute``` command, and upon completion shuts down the container
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
using the profile parameter. The default profile is dr_base, which contains:
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
