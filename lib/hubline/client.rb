module Hubline
  # The client class
  class Client
    # Creates a new Hubline Client
    #
    # @param state the initial state
    # @param octokit the octokit client
    # @param color_scheme the current color scheme
    def initialize(state, octokit, color_scheme)
      @state = state
      @octokit = octokit
      @color_scheme = color_scheme
    end

    # Executes the command given by the current input and
    # assigns the new state to @state
    def execute(input)
      @state = @state.execute(input, octokit)
    end

    # Displays the current state
    def display
      @state.display(@color_scheme)
    end
  end
end
