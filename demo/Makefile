APPNAME="oraclecatalystdemo"
SUDOUSERNAME=$(SUDO_USER)
CONFIGURATION="default"
TYPE="python"
PYTHONVERSION="3.11"
HOSTTYPE="default"
INTERNALUSER=$(SUDO_USER)
PLATFORM=".tlcache"
PLUGIN="cycle"
EXTRA="none"

help:
	@echo "usage: make [command]"

define kickoff
	@bash .tmp/bem/common/user.sh $(APPNAME) $(SUDOUSERNAME) $(CONFIGURATION) $(TYPE) $(PYTHONVERSION) $(HOSTTYPE) $(INTERNALUSER) $(PLATFORM) $(PLUGIN) $(EXTRA)
	@sudo bash .tmp/bem/common/superuser.sh $(APPNAME) $(SUDOUSERNAME) $(CONFIGURATION) $(TYPE) $(PYTHONVERSION) $(HOSTTYPE) $(INTERNALUSER) $(PLATFORM) $(PLUGIN) $(EXTRA)
	@sudo bash .tmp/bem/common/superuser.sh $(APPNAME) $(SUDOUSERNAME) $(CONFIGURATION) $(TYPE) $(PYTHONVERSION) vagrant $(INTERNALUSER) $(PLATFORM) $(PLUGIN) $(EXTRA)
endef

download_bash_environment_manager:
	@if test ! -d ".tmp";then \
		sudo su -m $(SUDO_USER) -c "mkdir -p .tmp"; \
		sudo su -m $(SUDO_USER) -c "mkdir -p .tmp/prep"; \
		sudo su -m $(SUDO_USER) -c "mkdir -p .tmp/bem"; \
		sudo su -m $(SUDO_USER) -c "mkdir -p .tmp/patterns"; \
  		sudo su -m $(SUDO_USER) -c "cd .tmp/prep; wget -O oracle-catalyst.zip https://github.com/terminal-labs/oracle-catalyst/archive/refs/heads/main.zip"; \
  		sudo su -m $(SUDO_USER) -c "cd .tmp/prep; unzip -n oracle-catalyst.zip"; \
  		sudo su -m $(SUDO_USER) -c "cp -r .tmp/prep/oracle-catalyst-main/manager/* .tmp/bem"; \
  		sudo su -m $(SUDO_USER) -c "cp -r .tmp/prep/oracle-catalyst-main/patterns/* .tmp/patterns"; \
	fi

up: HOSTTYPE="host"
up: INTERNALUSER=$(SUDO_USER)
up: download_bash_environment_manager
	@if test ! -f "Vagrantfile";then \
		cp .tmp/prep/oracle-catalyst-main/shelf/vagrantfiles/large Vagrantfile; \
		chown $(SUDO_USER) Vagrantfile; \
	fi
	$(call kickoff)
