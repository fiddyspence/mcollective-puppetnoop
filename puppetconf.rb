module MCollective
  module Agent
    # An agent to manage the Puppet configuration file to toggle noop

    class Puppetnoop<RPC::Agent
      metadata    :name        => "Puppet setting agent",
                  :description => "Modify Puppet config setting",
                  :author      => "fiddyspence",
                  :license     => "Apache License 2.0",
                  :version     => "1.0",
                  :url         => "https://github.com/fiddyspence/mcollective-puppetnoop",
                  :timeout     => 30

      require 'puppet/util/ini_file'
      require 'puppet'

      def startup_hook
        separator = '='
        file_path = Puppet['config'] || '/etc/puppetlabs/puppet/puppet.conf'
        @ini_file ||= Puppet::Util::IniFile.new(file_path, separator)
      end

      action "status" do
        reply[:value] = @ini_file.get_value(:section, :setting) || Puppet['noop']
      end

      action "edit" do
        @ini_file.set_value(:section, :setting, :value)
        @ini_file.save
      end

      private

    end
  end
end

# vi:tabstop=2:expandtab:ai:filetype=ruby
