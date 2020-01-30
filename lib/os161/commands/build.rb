require_relative '../colour'
require_relative '../utils'

module OS161
  module Commands
    class Build
      class << self
        def call(version)
          puts "Building the kernel with version #{version}"
          kern_dir = File.expand_path("~/cs350-os161/os161-1.99/kern")
          Utils::assert_dir_exists(kern_dir)
          conf_dir = "#{kern_dir}/conf"
          Utils::assert_dir_exists(conf_dir)
          Dir.chdir(conf_dir) do
            exe("./config ASST#{version}")
            compile_dir = "#{kern_dir}/compile/ASST#{version}"
            Utils::assert_dir_exists(compile_dir)
            Dir.chdir(compile_dir) do
              ["bmake depend", "bmake", "bmake install"].each { |cmd| exe(cmd) }
            end
          end
        end

        private

        def exe(cmd)
          output = `#{cmd} 2>&1`
          if $?.exitstatus == 0
            puts "Successfully did #{Colour::green(cmd)}"
          else
            puts "Failed during #{Colour::red(cmd)}"
            puts Colour::red("="*80)
            puts output
            puts Colour::red("="*80)
            exit(1)
          end
        end
      end
    end
  end
end
