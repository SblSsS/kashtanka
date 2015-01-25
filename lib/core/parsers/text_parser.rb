module Core
	class Parsers::TextParser
		def self.parse value
			value
		end

		def self.field_type
			:text
		end
	end
end