module OS161
  class Colour
    class << self
      def blue(str)
        return "`tput setaf 4`#{msg}#{reset}"
      end

      def green(str)
        return "`tput setaf 2`#{msg}#{reset}"
      end

      def red(str)
        return "`tput setaf 1`#{msg}#{reset}"
      end

      private

      def reset
        return "`tput sgr0`"
      end
    end
  end
end
