class Setting < ActiveRecord::Base

	#Validations
	validates :name, :value, presence: true

	#Callbacks
	after_update :update_config, if: "!prefs.present?"

	serialize :prefs, Hash

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

	def field_type
		begin
			Object.const_get("Core::Parsers::#{self.parser}").field_type
		rescue
			:string
		end
	end

	private

		def update_config
			puts "#{prefs.inspect}"
			#Settings.refresh
		end
	#---------------------------------------

end