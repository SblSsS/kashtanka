module Admin
	module BaseHelper

		def setting_field form, setting
			options = { class: "form-control", value: setting.value, autocomplete: 'off' }

			if setting.field_type == :boolean
				options.delete(:value)
				options[:checked] = setting.value
			end

			form.input setting.name, as: setting.field_type,
					input_html: options

		end

		def publish_class resource
			resource.published ? "glyphicon glyphicon-eye-open publish" : "glyphicon glyphicon-eye-close unpublish"
		end

	end
end