module Admin
	module BaseHelper

		def setting_field form, setting
			form.input setting.name, as: setting.field_type, input_html: { class: 'form-control', value: setting.value }
		end

	end
end