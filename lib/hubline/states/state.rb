require 'active_support/core_ext/class/attribute'
module Hubline
  # Baseclass for states
  class State

    class_attribute :subclasses, :inputs

    self.subclasses = {}
    self.inputs = {
      home: {
        state: :home,
        command: Hubline::ReceivedEventsCommand
      }
    }

    # Constructor for a state
    #
    # @param data the data relevant to the state
    def initialize(data=nil)
      @data = data
    end

    # Factory method for a state
    #
    # @param type the type of State to create
    # @param data the data to pass in as a parameter
    def self.create(type, data)
      self.subclasses[type].new(data)
    end

    # Default execute operations for all states
    #
    # @param input the input to the command
    # @param octokit The octokit client
    def execute(input, octokit)
      parsed = parse(input)
      command = self.inputs[parsed[0]]
      if command.nil?
        puts "Invalid command"
        self
      else
        self.class.create(command[:state], command[:command].new(octokit).execute(parsed[1]))
      end
    end

    # Default display method for all states
    # Probably will be overridens
    #
    # @param color_scheme the color scheme to use
    def display(color_scheme)
    end

  protected

    # register the subclass
    #
    # @param type the name to register the subclass under
    def self.register(type)
      subclasses[type] = self
    end

  private
    # Helper method to parse input
    #
    # @param input the input
    def parse(input)
      parsed = input.split(' ', 2)
      parsed[0] = parsed[0].to_sym
      parsed
    end

  end
end
