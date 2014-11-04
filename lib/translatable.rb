module Translatable

	private

	def acts_as_translatable *fields

		has_many :translations, as: :translatable

		default_scope { includes(:translations) }

		fields.each do |f|
			define_method "#{f}" do
				t = self.translations.find_by(field_name: f.to_s, locale: I18n.locale.to_s).try(:field_translation)
				t || self.read_attribute(f.to_sym)
			end

			define_method "#{f}=" do |value|
				if value.is_a?(Hash)
					t = self.translations.find_or_create_by(locale: value[:locale], field_name: f.to_s)
					t.update(field_translation: value[:translation])

					if self.read_attribute(f.to_sym).blank?
						self.write_attribute(f.to_sym, value[:translation])
					end
				else
					self.write_attribute(t.to_sym, value.to_s)
				end
			end

			define_method "original_#{f}" do
				self.read_attribute(f.to_sym)
			end

			define_method "original_#{f}=" do |value|
				self.write_attribute(f.to_sym, value)
			end
		end

		define_method "translatable=" do |translation_hash|
			translation_hash.each do |locale,value|
				value.each do |field,translation|
					raise "Field #{field} is not translatable. Add it to list." if !self.class.method_defined?("#{field}=")
					self.send("#{field}=",{locale: locale, translation: translation})
				end
			end
		end
	end

end