require_relative '../colour'
require_relative '../utils'

module OS161
  module Commands
    class Build
      class << self
        def call(version)
          puts "Building kernel-ASST#{version}"
          kern_dir = File.expand_path("~/cs350-os161/os161-1.99/kern")
          Utils::assert_dir_exists(kern_dir)
          conf_dir = "#{kern_dir}/conf"
          Utils::assert_dir_exists(conf_dir)
          Dir.chdir(conf_dir) do
            exe("./config ASST#{version}")
            compile_dir = "#{kern_dir}/compile/ASST#{version}"
            Utils::assert_dir_exists(compile_dir)
            Dir.chdir(compile_dir) do
              exe("bmake depend")
              find_bmake_build_number(exe("bmake"))
              exe("bmake install")
            end
          end
        end

        private

        def exe(cmd)
          output = `#{cmd} 2>&1`
          if $?.exitstatus == 0
            puts "Successfully did #{Colour::green(cmd)}"
            return output
          else
            puts "Failed during #{Colour::red(cmd)}"
            puts Colour::red("="*80)
            puts output
            puts Colour::red("="*80)
            exit(1)
          end
        end

        def find_bmake_build_number(str)
          build_nr = str.match(/\*\*\* This is ASST1 build #([1-9]+) \*\*\*/).captures.first
          puts Colour::blue("Build number: #{build_nr}")
        end
      end
    end
  end
end
