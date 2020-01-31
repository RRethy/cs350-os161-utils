require_relative './colour'

module OS161
  class Utils
    class << self
      def chdir(dir)
        assert_dir_exists(dir)
        Dir.chdir(dir) do
          yield
        end
      end

      def try_execute(cmd)
        system(cmd)
        if $?.exitstatus == 0
          puts "Successfully did #{Colour::green(cmd)}"
        else
          puts Colour::red("Failed doing {#{cmd}} with exit status of #{$?.exitstatus}")
        end
      end

      def must_execute(cmd)
        output = `#{cmd} 2>&1`
        if $?.exitstatus == 0
          puts "Successfully did #{Colour::green(cmd)}"
          return output
        else
          error(cmd, output)
        end
      end

      def begin_interative(cmd)
        system(cmd)
        if $?.exitstatus == 0
          puts "Successfully did #{Colour::green(cmd)}"
        else
          puts "Failed during #{Colour::red(cmd)}"
          exit(1)
        end
      end

      def assert_dir_exists(dir)
        unless File.directory?(File.expand_path(dir))
          puts Colour::red("Directory does not exist: #{dir}")
          exit(1)
        end
      end

      def error(cmd, output)
        puts "Failed during #{Colour::red(cmd)}"
        puts Colour::red("="*80)
        puts output
        puts Colour::red("="*80)
        exit(1)
      end
    end
  end
end
