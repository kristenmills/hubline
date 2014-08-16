module Hubline
  # The state representing home
  class HomeState < State
    register :home
    self.inputs = self.inputs.merge({
      next: {
        state: :home,
        command: Hubline::NextCommand
      }
    })
  end
end
