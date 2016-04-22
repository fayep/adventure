module Adventure
  class Base
    # Base adventure class, everything inherits from this
    attr_reader :state, :synonyms, :contents
    
    def initialize(from_state = nil, &block)
      @state = from_state || self.class.initial_state
      @synonyms = []
      @contents = []
      instance_eval(&block) if block_given?
    end

    class << self
      def initial_state
        {}
      end

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

    dsl_verb :short_description, :long_description, :is_visible?, :is_transparent?

    def contains(*args)
      args.each { |obj| @contents <<= obj }
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
