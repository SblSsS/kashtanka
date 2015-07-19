module Core
	module Settings

		def self.included(base)
			base.extend ClassMethods
		end

		module ClassMethods
			# Set accessors, class variables and db
			def set_pref name, options={}
				if options[:db]
					pref = set_db(name, options[:parser], options[:default]) 
					class_variable_set("@@#{name.to_s}", pref.value)
				else
					class_variable_set("@@#{name.to_s}", options[:default])
				end

				# Define setting reader
				define_singleton_method name do
					pref = class_variable_get("@@#{name.to_s}")
					
					if !pref && Setting.exists?(name: name.to_s)
						pref = Setting.find_by(name: name.to_s).value
						class_variable_set("@@#{name.to_s}", pref)
					end

					pref
				end
				
				# Define setting writer
				define_singleton_method "#{name.to_s}=" do |value|
					if options[:db]
						# Save or update value in database
						success = set_db(name).update(value: value)
						class_variable_set("@@#{name.to_s}", set_db(name).value)
						success
					else
						class_variable_set("@@#{name.to_s}", value)
						true
					end
				end
			end

			# Create or find value in database
			def set_db name, parser=nil, default=nil
				params = { name: name.to_s }
				params.merge!(parser: parser) if parser
				Setting.create_with(value: default).find_or_create_by(params)
			end
		end

	end
end