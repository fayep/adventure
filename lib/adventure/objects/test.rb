# This is an object with an initial state of something: :else.
module Adventure
  class Test < Base
    def self.initial_state
      { something: :else }
    end
  end
end
