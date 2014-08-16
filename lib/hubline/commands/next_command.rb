module Hubline
  class NextCommand < Command

    # Gets the next page
    #
    # @param input the input. Should be nil for this
    # @param the octokit client
    def self.execute(input, octokit)
      octokit.last_response.rels[:next].get.data
    end
  end
end
