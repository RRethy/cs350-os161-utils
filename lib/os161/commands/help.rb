module OS161
  module Commands
    class Help
      class << self
        def call
          puts <<-EOF
os161util [OPTION]

os161util is a utility command to help with the development of os161 in CS350 at
UWaterloo. TODO.

OPTIONS:
--help, -h:
    show help
--build version, -b version:
--run version, -r version:
          EOF
        end
      end
    end
  end
end
