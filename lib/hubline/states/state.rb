module Hubline
  # Baseclass for states
  class State

    cattr_accessor :subclasses, :commands
    self.subclasses = {}
    self.inputs = {
      home: {
        state: :home,
        command: PublicEventsCommand
      }
    }

    def initialize(data)
      @data = data
    end

    def self.create(type, data)
      self.subclasses[type].new(data)
    end

    # Default execute operations for all states
    def execute(input)
      parsed = parse(input)
      command = commands[parsed[0]]
      if command.nil?
        puts "Invalid command"
        self
      else
        self.create(command[:state], command[:command].execute(input))
      end
    end

    # Default display method for all states
    # Probably will be overridens
    def display
    end

  protected
    def register(type)
      subclasses[type] = self
    end

  private
    # Helper method to parse input
    def parse(input)
      parsed = input.split(' ', 2)
      parsed[0] = parsed[0].to_sym
      parsed
    end

  end
end
