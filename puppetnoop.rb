module MCollective
  module Agent
    # An agent to manage the Puppet configuration file to toggle noop

    class Puppetnoop<RPC::Agent
      metadata    :name        => "Puppet Noop agent",
                  :description => "Modify Puppet noop config setting",
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
        reply[:value] = @ini_file.get_value('agent', 'noop') || Puppet['noop']
      end

      ['enable','disable'].each do |act|
        action act do
          if act == 'enable'
            thesetting = 'true'
          else
            thesetting = 'false'
          end
          value = @ini_file.get_value('agent', 'noop')
          if value == nil or value != thesetting
            begin
              @ini_file.set_value('agent', 'noop', thesetting)
              @ini_file.save
              reply["status"] = 'success'
            rescue => e
              reply["status"] = "failure #{e.message}"
            end
          else
            reply["status"] = 'no change'
          end
        end
      end

      private

    end
  end
end

# vi:tabstop=2:expandtab:ai:filetype=ruby
