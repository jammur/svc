Svc - The Launchd Helper
========================
A ruby command line tool that provides a shortcut for starting and stopping launchd services on Mac OSX.

A config file will be created in your home directory (~/.svc) that will contain a hash of all the nicknames and plist locations. Be careful not to delete that file, as you will then have to manually re-add all the services.

Installation
------------
`$ gem install svc`

Usage
-----
To see a list of all available services:
`$ svc list`

To add a new service:
`$ svc add <nickname> <path_to_plist>`
	
To delete a service:
`$ svc delete <nickname>`
	
To start a service:
`$ svc start <nickname>`
	
To stop a service:
`$ svc stop <nickname>`
	
To restart a service:
`$ svc restart <nickname>`
