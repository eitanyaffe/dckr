# dckr: A docker wrapper

Usage: ./dckr <command> [-p <profile>] [-i <image>] [-n <name>] [-k <key>] <container_commands>
Commands:
  run: Run a container command on an docker image
  up: Create a singleton container and associate with a key
  down: Remove a singleton container associated with a key
  exec: Execute commands on singleton container associated with key
  ps: Show all running containers
Options:
  -i <image>: Docker image
  -p <file>: Profile file (default: '')
  -k <key>: Singleton key (Required only for up/down/exec commands)
  -n <name>: Specify container name for non-singlton container (default: none)
  -h: Create mounts for /home (default: false)
  -d: Print command line without executing (dry run)
