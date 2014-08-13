require 'highline/import'
require 'colorize'
require 'octokit'
require 'fileutils'

module Hubline
  # The CLI module
  module CLI
    extend self

    # Run the command loop
    def run
      client = authenticate
      return if client.nil?
    end

    # Authenticate the user
    def authenticate
      unless File.exists?(File.join(ENV['HOME'], '.config', 'hubline'))
        puts "Welcome to Hubline!".red
        username = ask("Username: ")
        password = ask("Password:  ") { |q| q.echo = false }
        unless Octokit.validate_credentials(login: username, password: password)
          puts "Invalid Login"
          return
        end
        client = Octokit::Client.new(login: username, password: password)
        token = client.create_authorization(scopes: ["user", "repo"], note: "hubline").token
        FileUtils.mkdir_p(File.join(ENV['HOME'], '.config'))
        File.write(File.join(ENV['HOME'], '.config', 'hubline'), token)
        client
      else
        Octokit::Client.new(access_token: File.read(File.join(ENV['HOME'], '.config', 'hubline')).chomp)
      end
    end
  end
end
