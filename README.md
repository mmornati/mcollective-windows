mcollective-windows
===================

List of Agents and Facts for MCollective Windows Server.
All agents are developped on WinXP machine and used in production on Windows
Server 2003 and Windows Server 2008.

Facts
-----
* **dns**: add some dns information to the server facts list. Used to check the
  configuration of machine into inventory
  Example of facts returned:
  <pre>
  dnsdomain: mobile.lan
  dnshostname: winxp-marco
  dnsservers: 
   "192.168.35.254"
  </pre>

Agents
------
* **Service**: the service agent will control services on your windows machine.
  Availables actions: list, start, stop and status

  Usage examples:
  ```bash
  mco rpc service list #show the list of all configured services
  mco rpc service status service_name=<sname> #get status of the provided service
  mco rpc service start service_name=<sname> #start the provided service (if it exists and it's not already started) and return the service status
  mco rpc service stop service_name=<sname> #stop the provided service (if it exists and it's running) and return the status
  ```

* **Eventlog**: get eventlogs from Windows Server. Available methods: list,
  applist (to filter on desired app)
  
  Usage examples:
  ```bash
  mco rpc eventlog list #show a complete list of the event logs on the windows server
  mco rpc eventlog applist app_name=<aname> #list the list of event logs for the provided application
  ```

* **Filesystem**: agents to retrieve information from server disks. To use this
  agent you should install the following ruby gems:
  ```bash
  gem install ruby-wmi
  gem install sys-filesystem
  ```

  Usage examples:
  ```bash
  mco rpc filesystem list  #List all available system disks
  Discovering hosts using the mc method for 2 second(s) .... 1
  
   * [ ============================================================> ] 1 / 1
  
  
  winxp-marco                              
     Disks: [{"device_id"=>"C:",
              "file_system"=>"NTFS",
              "name"=>"C:",
              "size"=>"32201936896",
              "free_space"=>"25386921984",
              "volume_serial_number"=>"C09C12E2"},
             {"device_id"=>"D:",
              "file_system"=>"FAT32",
              "name"=>"D:",
              "size"=>"16027541504",
              "free_space"=>"15589621760",
              "volume_serial_number"=>"6DC31C17"}]
  ```

  ```bash
  mco rpc filesystem diskstat disk_name=C  #Show information about the disks named C:
  Discovering hosts using the mc method for 2 second(s) .... 1

  * [ ============================================================> ] 1 / 1
 
 
  winxp-marco                              
     diskstat: {:free_space_mb=>24211.83,
                :free_space_gb=>23.64,
                :total_space_mb=>30710.16,
                :total_space_gb=>29.99,
                :block_size=>4096,
                :fs_type=>"NTFS",
                :fs_id=>3231453922}
  ```

