module MCollective
   module Agent
    class Service<RPC::Agent
	  require "win32/service"
	
      # Basic echo server
      action "list" do
		serviceslist = Array.new
		Win32::Service.services{ |s|
		    serviceslist.push({'service_name' => s.service_name, 'display_name' => s.display_name,
					'current_state' => s.current_state, 'binary_path_name' => s.binary_path_name,
					'start_type' => s.start_type, 'pid' => s.pid})
		}
        reply[:services] = serviceslist
      end
	  
	  action "start" do
		validate :service_name, String
		
		reply.fail! "Error - Service #{request[:service_name]} does not exist" unless Win32::Service.exists?(request[:service_name])
		reply.fail! "Warning - Service #{request[:service_name]} already started" unless Win32::Service.status(request[:service_name])!="running"
		Win32::Service.start(request[:service_name])
		reply[:status] = Win32::Service.status(request[:service_name]).current_state
	  end
	  
	  action "stop" do
		validate :service_name, String
		
		reply.fail! "Error - Service #{request[:service_name]} does not exist" unless Win32::Service.exists?(request[:service_name])
		reply.fail! "Warning - Service #{request[:service_name]} not running" unless Win32::Service.status(request[:service_name])!="stopped"
		Win32::Service.stop(request[:service_name])
		reply[:status] = Win32::Service.status(request[:service_name]).current_state
	  end
	  
	  action "status" do
		validate :service_name, String
		
		reply.fail! "Error - Service #{request[:service_name]} does not exist" unless Win32::Service.exists?(request[:service_name])
		reply[:status] = Win32::Service.status(request[:service_name]).current_state
	  end
    end
  end
end