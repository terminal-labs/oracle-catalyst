import time
import os
from threading import Thread
from time import sleep

import click
from bash import bash

from cli_passthrough import cli_passthrough

stop_thread = False

def threaded_function(arg):
	logfile = open("log","r")
	loglines = follow(logfile)
	for line in loglines:
		print(line)

def follow(thefile):
    thefile.seek(0, os.SEEK_END)
    while True:
        if stop_thread:
            break
        line = thefile.readline()
        if not line:
            time.sleep(0.1)
            continue
        yield line.strip()

def call_vm(cmd):
	return bash(f"""vagrant ssh -c 'cd /vagrant; . activate_vm.sh; {cmd}'""")
	
def ops_restart():
	call_vm("sudo shutdown -r now")
	return ops_check_print()
	
def ops_check_print():
	n = 1
	while n < 60:
		check = call_vm("cd /; ls")
		if check:
			return True
		n = n+1
	return False

def ops_update():
	updates = call_vm("cd /vagrant; sudo bash salt.sh >> log")
	return updates

@click.group()
@click.pass_context
def cli(ctx):
    pass
    
@click.group(name="internal")
def internal_group():
    pass
    
@click.group(name="external")
def external_group():
    pass
    
@click.group(name="cluster")
def cluster_group():
    pass

@internal_group.command(name="mem")
def mem():
    print(cli_passthrough("free -m"))
    
@internal_group.command(name="vm")
def vm():
    running_in_vm = False
    q = str(bash(f"""grep -q "^flags.*hypervisor" /proc/cpuinfo  && echo "true"\n"""))
    q = q.strip()
    if q == "true":
        running_in_vm = True
    print(running_in_vm)
    
@external_group.command(name="vm")
def vm():
    running_in_vm = False
    q = str(call_vm(f"""grep -q "^flags.*hypervisor" /proc/cpuinfo  && echo "true"\n"""))
    q = q.strip()
    if q == "true":
        running_in_vm = True
    print(running_in_vm)

@external_group.command(name="mem")
def mem():
    b = bash(f"""vagrant ssh -c 'cd /vagrant; . activate_vm.sh; {'hologramdemo internal mem'}'""")
    print(b.stderr)
    print(call_vm("hologramdemo internal mem"))

@cluster_group.command(name="salt")
def salt():
    print(cli_passthrough("sudo apt update"))
    
@cluster_group.command(name="restart")
def restart():
    print(ops_restart())
    
@cluster_group.command(name="steps")
def steps():
	thread = Thread(target = threaded_function, args = (0, ))
	thread.start()
	ops_update()
	global stop_thread
	stop_thread = True

cli.add_command(internal_group)
cli.add_command(external_group)
cli.add_command(cluster_group)
