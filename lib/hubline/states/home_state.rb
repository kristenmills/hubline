module Hubline
  # The state representing home
  class HomeState < State
    register :home
    self.inputs = self.inputs.merge({
      next: {
        state: :home,
        command: Hubline::NextCommand
      },
      n: {
        state: :home,
        command: Hubline::NextCommand
      }
    })

    def display(color_scheme)
      puts "News Feed"
      puts
      @data.each do |event|
        case event[:type]
        when 'CommitCommentEvent'
        when 'CreateEvent'
        when 'DeleteEvent'
        when 'ForkEvent'
          puts "    #{event.actor.login} forked #{event.repo.name}"
        when 'GollumEvent'
        when 'IssueCommentEvent'
        when 'IssuesEvent'
        when 'MemberEvent'
        when 'PublicEvent'
        when 'PullRequestReviewCommentEvent'
        when 'PushEvent'
        when 'ReleaseEvent'
        when 'TeamAddEvent'
        when 'WatchEvent'
          puts "    #{event.actor.login} starred #{event.repo.name}"
        end
        puts
      end
    end
  end
end
