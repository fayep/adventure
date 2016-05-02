module Adventure
  module Views
    class IrbView < Adventure::View
      def <<(content)
	case content
	when String
	  puts content
	when Array
	  content.each do |item|
	    puts "  #{item}"
	  end
	else
	  raise "Don't know how to output #{content.class} yet."
	end
      end
    end
  end

  View.instance(Adventure::Views::IrbView)
end
