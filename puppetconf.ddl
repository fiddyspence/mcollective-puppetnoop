metadata    :name        => "Puppet Noop",
            :description => "Setting editor for Puppet agent",
            :author      => "fiddyspence",
            :license     => "Apache License 2.0",
            :version     => "1.0",
            :url         => "https://github.com/fiddyspence/mcollective-puppetnoop",
            :timeout     => 20

action "status", :description => "get current value of a puppet setting" do
    display :always

    input :setting,
      :prompt      => "The setting",
      :description => "The setting to check",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    input :section,
      :prompt      => "The section",
      :description => "The section to check",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    output "value",
           :description => "current setting",
           :display_as => "current setting"
end

action "edit", :description => "edit puppet setting" do
  
  display :failed

  input :setting,
    :prompt      => "The setting",
    :description => "The setting to edit",
    :type        => :string,
    :validation  => '^[a-zA-Z\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 90

    input :section,
      :prompt      => "Setting section",
      :description => "The configuration file section the setting is in",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    input :value,
      :prompt      => "Setting value",
      :description => "The value to assign the setting",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    output "status",
      :description => "The status of the value after edit",
      :display_as  => "new setting"

end
