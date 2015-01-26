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

		def translation_fieldset form, field, object, index, iso, options={}
			options[:as] = object.class::CKEDITOR_FIELDS.include?(field) ? :ckeditor : object.class.columns_hash[field.to_s].type
		
			translation = object.translations.find_by(field_name: field, locale: iso)
			prefix 			= "#{object.class.name.parameterize}[translations_attributes][#{index}]"
			id_prefix   = "#{object.class.to_s.parameterize}_#{field.to_s}_#{iso.to_s}"

			if translation
				id 				= form.input :id, as: :hidden, input_html: {value: translation.id, name: "#{prefix}[id]"}
			else
				id 				= ''
			end

			name   			= form.input :field_name, as: :hidden, input_html: {value: field, name: "#{prefix}[field_name]",
											id: "#{id_prefix}_field_name"}
			locale    	= form.input :locale, as: :hidden, input_html: { value: iso, name: "#{prefix}[locale]", 
											id: "#{id_prefix}_locale" }
			value  			= form.input :field_translation, label: object.class.human_attribute_name(field),
											as: options[:as], required: false,
											input_html: { value: translation ? translation.field_translation : '',
											name: "#{prefix}[field_translation]", 
											class: "form-control #{options[:class] ? options[:class] : ''}",
											id: "#{id_prefix}_field_translation" }

			('<div>' + id + name + locale + value + '</div>').html_safe
		end

		def tags_input form, resource
			form.association :tags, collection: resource.class.tag_counts_on(:tags).map(&:name), selected: resource.tag_list, 
										input_html: { class: 'chosen-select tags form-control', multiple: true, autocomplete: "off" }
		end

		def sort_link klass, params, field
			if params[:sort_by] == field
				params[:order] = params[:order] == 'asc' ? 'desc' : 'asc'
				style = params[:order] == 'desc' ? 'glyphicon glyphicon-arrow-down' : 'glyphicon glyphicon-arrow-up'
			else
				new_hash = { sort_by: field, order: 'asc' }
			end

			new_hash ||= {}

			arrow = style ? content_tag(:i, '', class: style) : ''
			link  = link_to klass.human_attribute_name(field), url_for(params.merge(new_hash))

			(link + arrow).html_safe 
				 
		end

	end
end