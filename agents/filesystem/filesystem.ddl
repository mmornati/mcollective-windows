metadata    :name        => "Windows Disk Stats",
            :description => "Get disk information for Windows Server",
            :author      => "Marco Mornati",
            :license     => "GPLv3",
            :version     => "1.0",
            :url         => "",
            :timeout     => 10

action "list", :description => "Get list of configured disks" do
    display :always

    output  :disks,
            :description => "List of disks",
            :display_as  => "Disks"
end

action "diskstat", :description => "Disk Information" do
    display :always

    input  :disk_name,
           :prompt      => "Disk Name",
           :description => "Name of the disk (ex. C, D, ...)",
           :type        => :string,
           :validation  => '^[a-zA-Z\-_\d\.]+$',
           :optional    => false,
           :maxlength   => 1

    output :diskstats,
           :description => "Stats for the provided disk",
           :display_as  => "DiskStats"
end