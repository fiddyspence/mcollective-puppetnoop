metadata    :name        => "Puppet Noop",
            :description => "enable/disable noop for Puppet agent",
            :author      => "fiddyspence",
            :license     => "Apache License 2.0",
            :version     => "1.0",
            :url         => "https://github.com/fiddyspence/mcollective-puppetnoop",
            :timeout     => 20

action "status", :description => "Get a summary of the last puppet run" do
    display :always

    output :mode,
           :description => "Time per resource type",
           :display_as => "String"
end

action "enable", :description => "Enable puppet noop mode" do
    output :output,
           :description => "String indicating status",
           :display_as => "Status"
end

action "disable", :description => "Disable puppet noop mode" do
    output :output,
           :description => "String indicating status",
           :display_as => "Status"
end
