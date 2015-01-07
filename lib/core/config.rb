module Core
	class Config

		attr_accessor :setting_hash

		def initialize first=false
			@setting_hash = {}
			refresh_hash

			if first
				puts "Loading settings first time ..."
			else
				puts "Loading settings once again ..."
				@preferences  = Setting.find_by(name: "preferences")
				@setting_hash.merge!(@preferences.prefs)
			end

			save_hash
		end

		def refresh_hash
			load_from_db.each do |setting|
				instance_variable_set("@#{setting.name}", setting.value)
				@setting_hash[setting.name.to_sym] = setting.value
			end			
		end

		def save_hash
			non_db_settings = {}
			db_keys = load_from_db.pluck(:name).collect {|s| s.to_sym}
			@setting_hash.each do |k,v|
				non_db_settings[k] = v if !db_keys.include?(k)
			end
			
			@preferences.update(prefs: non_db_settings)
		end

		private

		def load_from_db
			@preferences = Setting.create_with(value: true).find_or_create_by(name: "preferences")
			settings 		 = []
			settings << @preferences.try(:id)
			settings << Setting.create_with(value: true).find_or_create_by(name: "enabled", parser: "BooleanParser").try(:id)
			settings << Setting.create_with(value: "Kashtanka v.1.0.0").find_or_create_by(name: "title").try(:id)
			Setting.where("id NOT IN (?)",settings).each {|s| s.destroy}
			Setting.where("id != ?", @preferences.id)
		end		
	end
end