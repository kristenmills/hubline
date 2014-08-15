module Hubline
  # Base class for commands
  class Command

    # Default constructor for all commands
    def initialize(octokit)
      @octokit = octokit
    end

    # Execute method for a command
    # Should be overridden
    def execute
    end
  end
end
