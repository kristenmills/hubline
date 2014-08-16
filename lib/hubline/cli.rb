require 'highline/import'
require 'octokit'
require 'fileutils'

module Hubline
  # The CLI module
  module CLI
    extend self

    # Run the command loop
    def run
      puts "Welcome to Hubline!"
      octokit = authenticate(ARGV)
      unless octokit.nil?
        client = Hubline::Client.new(nil, octokit, nil)
        puts "Press h if you need help"
        loop do
          input = ask("[#{octokit.login}]: ")
          break if input == 'exit'
          if input == 'help' || input == 'h'
            client.help
          else
            client.execute(input)
            client.display
          end
        end
      end
    rescue Interrupt
      puts
    ensure
      puts "Goodbye!"
    end

    # Authenticate the user
    #
    # @param prompt whether or not to prompt for credentials again
    def authenticate(args)
      if !File.exists?(File.join(ENV['HOME'], '.config', 'hubline')) || args.include?('-p')
        username = ask("Username: ")
        password = ask("Password: ") { |q| q.echo = false }
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
        token = File.read(File.join(ENV['HOME'], '.config', 'hubline')).chomp
        unless Octokit.validate_credentials(access_token: token)
          puts "Invalid Login. Run with -a to regenerate your token."
          return
        end
        Octokit::Client.new(access_token: token)
      end
    end
  end
end
