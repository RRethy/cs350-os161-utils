module OS161
  class Colour
    class << self
      def blue(str)
        with_colour("\e[34m", str)
      end

      def green(str)
        with_colour("\e[32m", str)
      end

      def red(str)
        with_colour("\e[31m", str)
      end

      private

      def with_colour(escape_seq, str)
        if STDOUT.isatty
          "#{escape_seq}#{str}#{reset}"
        else
          str
        end
      end

      def reset
        return "\e[37m"
      end
    end
  end
end
