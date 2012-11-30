metadata    :name        => "Puppet Noop",
            :description => "general purpose puppet.conf settings agent",
            :author      => "fiddyspence",
            :license     => "Apache License 2.0",
            :version     => "1.0",
            :url         => "https://github.com/fiddyspence/mcollective-puppetnoop",
            :timeout     => 20

action "status", :description => "get current value of the puppet agent noop setting" do
    display :always

    output :value,
           :description => "current noop setting",
           :display_as => "current setting"
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
