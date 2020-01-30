require_relative '../colour'

module OS161
  module Commands
    class Build
      class << self
        def call(version)
          puts "Building the kernel with version #{version}"
          # TODO ensure this dir exists
          Dir.chdir(File.expand_path("~/cs350-os161/os161-1.99/kern/conf")) do
            # TODO ensure this dir exists
            exe("./config ASST#{version}")
            Dir.chdir(File.expand_path("cd ~/cs350-os161/os161-1.99/kern/compile/ASST#{version}")) do
              [
                "bmake depend",
                "bmake",
                "bmake install"
              ].each do |cmd|
                exe(cmd)
              end
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
            puts output.msg
            puts Colour::red("="*80)
            exit(1)
          end
        end
      end
    end
  end
end
