require 'getoptlong'
require_relative './os161/commands/help'
require_relative './os161/commands/build'

module OS161
  class CLI
    class << self
      def start(argv)
        parse_opts(argv)
      end

      private

      def parse_opts(argv)
        opts = GetoptLong.new(
          [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
          [ '--build', '-b', GetoptLong::REQUIRED_ARGUMENT ]
        )
        if argv.length == 0
          Commands::Help.call
          exit 2
        end

        opts.each do |opt, arg|
          case opt
          when '--help'
            Commands::Help.call
          when '--build'
            Commands::Build.call(arg)
          else
            Commands::Help.call
          end
        end
      end
    end
  end
end
