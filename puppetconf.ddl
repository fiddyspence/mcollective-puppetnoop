metadata    :name        => "Puppet Noop",
            :description => "enable/disable noop for Puppet agent",
            :author      => "fiddyspence",
            :license     => "Apache License 2.0",
            :version     => "1.0",
            :url         => "https://github.com/fiddyspence/mcollective-puppetnoop",
            :timeout     => 20

action "status", :description => "get current value of a puppet setting" do

    display :always

    input :setting,
      :prompt      => "The setting",
      :description => "The setting to #{act}",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    input :section,
      :prompt      => "The section",
      :description => "The section to #{act}",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    output :value,
           :description => "current setting",
           :display_as => "current setting"
end

["edit"].each do |act|
  action act, :description => "#{act} puppet setting" do
  
    display :failed

    input :setting,
      :prompt      => "The setting",
      :description => "The setting to #{act}",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    input :section,
      :prompt      => "Setting section",
      :description => "The setting to #{act}",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    input :value,
      :prompt      => "Setting value",
      :description => "The setting to #{act}",
      :type        => :string,
      :validation  => '^[a-zA-Z\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 90

    output "status",
      :description => "The status of the service after #{act.sub(/p$/, 'pp')}ing",
      :display_as  => "Service Status"

  end
end
