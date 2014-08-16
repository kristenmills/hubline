module Hubline

  # The class for getting recieved events
  class ReceivedEventsCommand < Command

    # Gets the received events for a user
    #
    # @param input the input. Should be nil for this
    # @param the octokit client
    def self.execute(input, octokit)
      octokit.recieved_events(octokit.user.login)
    end
  end
end
