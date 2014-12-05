module Core
	class Parsers::BooleanParser
		def self.parse value
			ActiveRecord::ConnectionAdapters::Column.value_to_boolean( value )
		end
	end
end