module Actions
  module Player
    def inventory
      output << "You are carrying:"
      output << self.contents.map { |object| object.name }
    end

    alias :inv :inventory

  end
end
