mcollective-windows
===================

List of Agents and Facts for MCollective Windows Server.
All agents are developped on WinXP machine and used in production on Windows
Server 2003 and Windows Server 2008.

Facts
-----
* **dns**: add some dns information to the server facts list. Used to check the
  configuration of machine into inventory

Agents
------
* **Service**: the service agent will control services on your windows machine.
  Availables actions: list, start, stop and status

  Usage examples:
  ```bash
  mco rpc service list #show the list of all configured services
  mco rpc service status service_name=<sname> #get status of the provided
  service
  mco rpc service start service_name=<sname> #start the provided service (if it
  exists and it's not already started) and return the service status
  mco rpc service stop service_name=<sname> #stop the provided service (if it
  exists and it's running) and return the status
  ```

* **Eventlog**: get eventlogs from Windows Server. Available methods: list,
  applist (to filter on desired app)
  
  Usage examples:
  ```bash
  mco rpc eventlog list #show a complete list of the event logs on the windows
  server
  mco rpc eventlog applist app_name=<aname> #list the list of event logs for the
  provided application
  ```
