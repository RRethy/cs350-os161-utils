require 'getoptlong'
require_relative './os161/pq'
require_relative './os161/commands/help'
require_relative './os161/commands/build'
require_relative './os161/commands/run'

module OS161
  class CLI
    class << self
      def start(argv)
        parse_opts(argv)
      end

      private

      def parse_opts(argv)
        pq = PQ.new
        options = Options.instance
        opts = GetoptLong.new(
          [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
          [ '--build', '-b', GetoptLong::NO_ARGUMENT ],
          [ '--run', '-r', GetoptLong::NO_ARGUMENT ],
          [ '--assignment_number', '-n', GetoptLong::REQUIRED_ARGUMENT ]
        )
        if argv.length == 0
          Commands::Help.call
          exit 2
        end

        opts.each do |opt, arg|
          case opt
          when '--help'
            pq.push(Commands::Help, 0)
          when '--build'
            pq.push(Commands::Build, 1)
          when '--run'
            pq.push(Commands::Run, 2)
          when '--assignment_number'
            options.assn_nr = arg
          end
        end

        options.set_defaults
        while !pq.empty?
          pq.pop.val.call
        end
      end
    end
  end
end
