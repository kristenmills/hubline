
module Hubline
  # Baseclass for states
  class State

    # Default execute operations for all states
    def execute(input)
      parsed = parse(input)
      # TODO: Default commands
    end

    # Default display method for all states
    # Should be overriden
    def display
    end

  protected
    # Helper method to parse input
    def parse(input)
      input.split(' ', 1)
      input[0] = input[0].to_sym
      input
    end

  end
end
