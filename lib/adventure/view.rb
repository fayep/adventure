module Adventure
  class View
    class << self
      def <<(content)
        raise "no instance" unless @@instance
        @@instance << content
      end

      def instance(klass=nil)
        @@instance ||= klass.new
      end
    end
  end
end
