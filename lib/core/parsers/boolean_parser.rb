module Core
	class Parsers::BooleanParser
		def self.parse value
			ActiveRecord::ConnectionAdapters::Column.value_to_boolean( value )
		end

		def self.field_type
			:boolean
		end
	end
end