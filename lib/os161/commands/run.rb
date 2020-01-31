require_relative '../colour'
require_relative '../utils'
require_relative '../options'

module OS161
  module Commands
    class Run
      class << self
        def call
          version = Options.instance.assn_nr
          cmd = Options.instance.cmd
          if version.nil?
            kernel = "kernel"
          else
            kernel = "kernel-ASST#{version}"
          end
          puts Colour::blue("Starting 'sys161' with kernel #{kernel}")
          root_dir = File.expand_path("~/cs350-os161/root")
          Utils::chdir(root_dir) do
            if cmd.nil?
              Utils::begin_interative("sys161 #{kernel}")
            else
              Utils::try_execute("sys161 #{kernel} \"#{cmd}:q\"")
            end
          end
        end
      end
    end
  end
end
