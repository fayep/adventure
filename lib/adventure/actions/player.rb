module Adventure
  module Actions
    # Player actions - things the player can do.
    # Self will be the object with this mixin.  Usually, in this case, our player.
    module Player
      # The standard command for listing the things you're carrying.
      def inventory
        View << "You are carrying:"
        if self.contents.empty?
          View << %w(nothing)
        else
          View << self.contents.map { |object| object.name }
        end
      end

      # this is how we give an additional name to a method
      alias :inv :inventory

    end
  end
end
