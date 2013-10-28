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
