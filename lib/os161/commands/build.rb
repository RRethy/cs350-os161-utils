require_relative '../colour'
require_relative '../utils'
require_relative '../options'

module OS161
  module Commands
    class Build
      class << self
        def call
          version = Options.instance.assn_nr
          puts Colour::blue("Building kernel-ASST#{version}")
          kern_dir = File.expand_path("~/cs350-os161/os161-1.99/kern")
          conf_dir = "#{kern_dir}/conf"
          Utils::chdir(conf_dir) do
            Utils::must_execute("./config ASST#{version}")
            compile_dir = "#{kern_dir}/compile/ASST#{version}"
            Utils::chdir(compile_dir) do
              Utils::must_execute("bmake depend")
              print_bmake_build_number(Utils::must_execute("bmake"))
              Utils::must_execute("bmake install")
            end
          end
        end

        private

        def print_bmake_build_number(bmake_output)
          buildnr = bmake_output.match(/\*\*\* This is ASST1 build #([0-9]+) \*\*\*/).captures.first
          puts Colour::blue("Build number: #{buildnr}")
        end
      end
    end
  end
end
