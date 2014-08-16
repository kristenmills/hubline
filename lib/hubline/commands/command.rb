module Hubline
  # Base class for commands
  class Command

    # Default constructor for all commands
    #
    # @param octokit the octokit client
    def initialize(octokit)
      @octokit = octokit
    end

    # Execute method for a command
    # Should be overridden
    #
    # @param input the input
    def execute(input)
    end
  end
end
