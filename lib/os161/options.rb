require 'date'
require 'singleton'
require_relative './colour'

module OS161
  class Options
    include Singleton

    attr_writer :assn_nr
    attr_accessor :cmd

    def set_defaults
      @assn_nr ||= assn_nr_heuristic
    end

    def kernel_version
      @assn_nr[0]
    end

    private

    def assn_nr_heuristic
      today = Date.today
      if today <= Date.new(2020, 6, 5)
        '0'
      elsif today <= Date.new(2020, 6, 10)
        '1'
      elsif today <= Date.new(2020, 6, 26)
        '2a'
      elsif today <= Date.new(2020, 7, 10)
        '2b'
      elsif today <= Date.new(2020, 7, 1)
        '3'
      else
        puts Colour::red("Hello future humans.\nI can't figure out what assignment you are working on because I was built using the deadlines from W20.\nPlease submit a patch at github.com/RRethy/cs350-os161-utils to the file ./lib/os161/options.rb.\nOr specify the --assignment_number (-n) option.")
        exit(1)
      end
    end
  end
end
