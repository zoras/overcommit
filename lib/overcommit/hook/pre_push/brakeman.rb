module Overcommit::Hook::PrePush
  # Runs `brakeman` before push
  #
  # @see http://brakemanscanner.org/
  class Brakeman < Base
    def run
      result = execute(command)
      return :pass if result.success?

      output = result.stdout + result.stderr
      [:fail, output]
    end
  end
end
