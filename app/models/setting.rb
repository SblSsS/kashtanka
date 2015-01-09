class Setting < ActiveRecord::Base

	#Validations
	validates :name, presence: true
	validates :value, presence: true, if: :cant_be_blank?

	#Scopes
	scope :editable, -> { where("name != ?", "preferences").order(:name) }

	#Callbacks
	after_update :update_config

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

		def cant_be_blank?
			field_type != :boolean
		end

		def update_config
			if name != "preferences"
				Settings.refresh
			end
		end
	#---------------------------------------

end