PROFILE_DIR=/etc/docker/profiles
TOOLS_DIR=/etc/docker/tools
BIN_DIR=/usr/bin

install:
	cp dr $(BIN_DIR)
	mkdir -p $(PROFILE_DIR) $(TOOLS_DIR)
	cp profiles/* $(PROFILE_DIR)
	cp tools/* $(TOOLS_DIR)
