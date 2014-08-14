module Hubline
  # The client class
  class Client
    # Creates a new Hubline Client
    #
    # @param state the initial state
    # @param octokit the octokit client
    def initialize(state, octokit)
      @state = state
      @octokit = octokit
    end

    # Executes the command given by the current input and
    # assigns the new state to @stateåå
    def execute(input)
      @state = @state.execute(input, octokit)
    end
  end
end
