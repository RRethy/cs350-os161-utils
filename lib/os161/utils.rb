require_relative './colour'

module OS161
  class Utils
    class << self
      def assert_dir_exists(dir)
        unless File.directory?(File.expand_path(dir))
          puts Colour::red("Directory does not exist: #{dir}")
        end
      end
    end
  end
end
