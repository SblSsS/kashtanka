module Core
	class Config

		attr_accessor :setting_hash

		def initialize
			puts "Loading settings ..."
			@setting_hash = {}
			db_settings 	= Setting.all

			load_from_db
			load_from_file

			db_settings.each do |setting|
				instance_variable_set("@#{setting.name}", setting.value)
				@setting_hash[setting.name.to_sym] = setting.value
			end
		end

		private

		def load_from_db
			Setting.create(name: "enabled", value: "true", parser: "BooleanParser") if !Setting.exists?(name: "enabled")
			Setting.create(name: "title", value: "Kashtanka v.1.0.0") if !Setting.exists?(name: "title")
		end		

		def load_from_file
		end
	end
end