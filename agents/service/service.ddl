metadata    :name        => "Windows Service",
            :description => "Windows Services Controller",
            :author      => "Marco Mornati",
            :license     => "GPLv3",
            :version     => "1.0",
            :url         => "",
            :timeout     => 10

action "list", :description => "Get the list of defined services" do
    display :always

    output  :services,
            :description => "List of defined services",
            :display_as  => "Services"
end

action "status", :description => "Get Service status" do
    display :always

    input  :service_name,
           :prompt      => "Service Name",
           :description => "Name of the service to check",
           :type        => :string,
           :validation  => '^[a-zA-Z\-_\d\.]+$',
           :optional    => false,
           :maxlength   => 40

    output :status,
           :description => "The status of the service",
           :display_as  => "Status"
end

action "start", :description => "Start the provided Service" do
    display :always

    input  :service_name,
           :prompt      => "Service Name",
           :description => "Name of the service to start",
           :type        => :string,
           :validation  => '^[a-zA-Z\-_\d\.]+$',
           :optional    => false,
           :maxlength   => 40

    output :status,
           :description => "The status of the service",
           :display_as  => "Status"
end

action "stop", :description => "Stop the provided Service" do
    display :always

    input  :service_name,
           :prompt      => "Service Name",
           :description => "Name of the service to stop",
           :type        => :string,
           :validation  => '^[a-zA-Z\-_\d\.]+$',
           :optional    => false,
           :maxlength   => 40

    output :status,
           :description => "The status of the service",
           :display_as  => "Status"
end