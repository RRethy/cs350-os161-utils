module OS161
  class Colour
    class << self
      def blue(str)
        return "\e[34m#{str}#{reset}"
      end

      def green(str)
        return "\e[32m#{str}#{reset}"
        return "`tput setaf 2`#{str}#{reset}"
      end

      def red(str)
        return "\e[31m#{str}#{reset}"
      end

      private

      def reset
        return "\e[37m"
      end
    end
  end
end
