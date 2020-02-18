require_relative '../colour'
require_relative '../utils'

module OS161
  module Commands
    class GitResetMasterOrigin
      class << self
        def call
          kern_dir = File.expand_path("~/cs350-os161/os161-1.99/kern")
          Utils::chdir(kern_dir) do
            puts Colour::blue("Resetting master to origin/master")
            Utils::must_execute("git fetch --all && git reset --hard origin/master")
          end
        end
      end
    end
  end
end
