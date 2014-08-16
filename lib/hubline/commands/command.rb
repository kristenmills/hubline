module Hubline
  # Base class for commands
  class Command

    # Execute method for a command
    # Should be overridden
    #
    # @param input the input
    # @param octokit the octokit client
    def self.execute(input, octokit)
    end
  end
end
