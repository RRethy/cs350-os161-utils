require_relative '../colour'
require_relative '../utils'

module OS161
  module Commands
    class Run
      class << self
        def call(version)
          if version.nil?
            kernel = "kernel"
          else
            kernel = "kernel-ASST#{version}"
          end
          puts Colour::blue("Starting 'sys161' with kernel #{kernel}")
          root_dir = File.expand_path("~/cs350-os161/root")
          Utils::chdir(root_dir) do
            Utils::begin_interative("sys161 #{kernel}")
          end
        end
      end
    end
  end
end
