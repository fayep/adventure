module Adventure
  # Base adventure class, everything inherits from this
  class Base
    attr_reader :state, :synonyms, :contents, :id
    
    def initialize(id, from_state = nil, &block)
      @id = id
      @state = from_state || self.class.initial_state
      @synonyms = []
      @contents = []
      instance_eval(&block) if block_given?
    end

    class << self
      def initial_state
        {}
      end

      # It can get pretty tedious writing the same thing again and again.
      # If you can describe it, you can code it.  This is some metaprogramming
      # It's an advanced ruby concept.
      def dsl_verb(*args, &block)
        args.each do |a|
          if block_given?
            define_method a, &block
          else
            define_method a do |*var|
              varname = "@#{a}"
              varname.chop! if varname.end_with? '?'
              instance_variable_set(varname.to_sym,var.first) if var.length == 1
              instance_variable_get(varname.to_sym)
            end
          end
        end
      end
    end

    def synonym(syn)
      @synonyms <<= syn
    end

    dsl_verb :short_description, :long_description, :is_visible?, :is_transparent?, :location

    # Look around you, look around you.. just... look around you.
    def look(*obj)
      puts obj.inspect
      if obj.length > 0
        Game.instance.objects[obj.first].look
      elsif self == Game.instance.player
        Game.instance.objects[location].look
      else
        View << short_description
        View << long_description if long_description
      end
    end

    def contains(*args)
      args.each do |obj|
        @contents <<= obj
        gameobject = Game.instance.objects[obj]
        if gameobject && gameobject.location
          raise "#{obj} is already in #{gameobject.location}"
        elsif gameobject
          gameobject.location id
        else
          raise "#{obj} needs to be defined first"
        end
      end
    end

    def initially(&block)
      instance_eval(&block) if block_given?
      @initial_state = @state if @state
    end

    def include(mod)
      self.class.send(:include, mod)
    end

  end
end
