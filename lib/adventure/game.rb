module Adventure
  class Game < Base

    attr_reader :player, :objects

    def initialize(&block)
      @objects = {}
      @player = nil
    end

    def object(id, &block)
      @objects[id] = Adventure::Base.new(id, &block)
      @player = @objects[id] if id == :player
      puts "Adding #{id} to object list"
    end

    class << self
      def instance(&block)
        @@instance ||= Game.new
        @@instance.instance_eval(&block) if block_given?
        @@instance
      end
    end
  end
end

@instance = Adventure::Game.instance

def method_missing(method, *args)
  instance = Adventure::Game.instance
  # puts "instance: #{instance} player: #{instance.player} method: #{method}"
  if instance.player
    if instance.player.respond_to?(method)
      instance.player.send(method, *args)
    elsif instance.player.location && instance.objects[instance.player.location].respond_to?(method)
      instance.objects[instance.player.location].send(method, *args)
    else
      super
    end
  end
end
