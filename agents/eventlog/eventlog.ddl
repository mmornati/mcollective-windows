metadata    :name        => "EventLog Windows",
            :description => "Log Events for Windows Server",
            :author      => "Marco Mornati",
            :license     => "GPLv3",
            :version     => "1.0",
            :url         => "",
            :timeout     => 10

action "list", :description => "Get list of events logged in Windows log registry" do
    display :always

    output  :events,
            :description => "List of events",
            :display_as  => "Events"
end

action "applist", :description => "Get list of events logged in Windows log registry for the desired application" do
    display :always

    input  :app_name,
           :prompt      => "Application Name",
           :description => "Name of the application to check",
           :type        => :string,
           :validation  => '^[a-zA-Z\-_\d\.]+$',
           :optional    => false,
           :maxlength   => 40

    output :events,
           :description => "List of events",
           :display_as  => "Events"
end