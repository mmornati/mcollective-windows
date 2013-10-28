module MCollective
   module Agent
    class Eventlog<RPC::Agent
	  require "win32/eventlog"
	  
	  action "list" do
		eventslist = Array.new
		Win32::EventLog.read{ |log|
		    eventslist.push({
			   'record_number' => log.record_number,
			   'time_generated' => log.time_generated,
			   'time_written' => log.time_written,
			   'event_id' => log.event_id,
			   'event_type' => log.event_type, 
			   'source' => log.source,
			   'computer' => log.computer,
			   'user' => log.user,
			   'description' => log.description
			})
		}
        reply[:events] = eventslist
      end
	  
	  action "applist" do
	    validate :app_name, String
		
		eventslist = Array.new
		Win32::EventLog.read { |log|
			if log.source == request[:app_name] 
		        eventslist.push({
				   'record_number' => log.record_number,
				   'time_generated' => log.time_generated,
				   'time_written' => log.time_written,
				   'event_id' => log.event_id,
				   'event_type' => log.event_type, 
				   'source' => log.source,
				   'computer' => log.computer,
				   'user' => log.user,
				   'description' => log.description
			    })
			end
		}
        reply[:events] = eventslist
      end
	  
	end
   end
end