require_relative '../colour'
require_relative '../utils'
require_relative '../options'

module OS161
  module Commands
    class BuildUserPrograms
      class << self
        def call
          puts Colour::blue("Building user level programs")
          top_level_dir = File.expand_path("~/cs350-os161/os161-1.99")
          Utils::chdir(top_level_dir) do
            Utils::must_execute("bmake")
            Utils::must_execute("bmake install")
          end
        end
      end
    end
  end
end
