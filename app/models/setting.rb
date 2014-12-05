class Setting < ActiveRecord::Base

	#Methods--------------------------------
	def value
		begin 
			parser_class = Object.const_get("Core::Parsers::#{self.parser}")
		rescue
			parser_class = nil
		end 

		if !parser.blank? && parser_class
			parser_class.parse read_attribute(:value)
		else
			read_attribute(:value)
		end
	end
	#---------------------------------------

end