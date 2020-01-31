require 'date'
require 'singleton'
require_relative './colour'

module OS161
  class Options
    include Singleton

    attr_accessor :assn_nr
    attr_accessor :cmd

    def set_defaults
      @assn_nr ||= assn_nr_heuristic
    end

    private

    def assn_nr_heuristic
      today = Date.today
      if today <= Date.new(2020, 1, 17)
        0
      elsif today <= Date.new(2020, 2, 3)
        1
      elsif today <= Date.new(2020, 2, 24)
        2
      elsif today <= Date.new(2020, 3, 16)
        3
      elsif today <= Date.new(2020, 4, 1)
        4
      else
        puts Colour::red("Hello future humans.\nI can't figure out what assignment you are working on because I was built using the deadlines from W20.\nPlease submit a patch at github.com/RRethy/cs350-os161-utils to the file ./lib/os161/options.rb.\nOr specify the --assignment_number (-n) option.")
        exit(1)
      end
    end
  end
end
