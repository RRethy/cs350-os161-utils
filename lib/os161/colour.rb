module OS161
  class Colour
    class << self
      def blue(str)
        return "`tput setaf 4`#{str}#{reset}"
      end

      def green(str)
        return "`tput setaf 2`#{str}#{reset}"
      end

      def red(str)
        return "`tput setaf 1`#{str}#{reset}"
      end

      private

      def reset
        return "`tput sgr0`"
      end
    end
  end
end
