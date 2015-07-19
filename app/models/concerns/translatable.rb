module Translatable
  extend ActiveSupport::Concern

  included do
    has_many :translations, as: :translatable
    default_scope { includes(:translations) }
    accepts_nested_attributes_for :translations, reject_if: :invalid?

    after_create :create_default_translation
  end

  module ClassMethods
    def acts_as_translatable *fields
      
      field_names   = []
      editor_fields = []

      fields.each do |field|
        if field.is_a? Hash
          field_names += field.keys
          field.each do |key, value|
            editor_fields << key if value == :ckeditor
          end
        else
          field_names << field
        end
      end

      self.table_name.singularize.camelize.constantize.const_set(:TRANSLATABLE_FIELDS, field_names)
      self.table_name.singularize.camelize.constantize.const_set(:CKEDITOR_FIELDS, editor_fields)

      field_names.each do |f|
        define_method "#{f}" do
          if Core.multilanguage
            t = self.translations.find_by(field_name: f.to_s, locale: I18n.locale.to_s).try(:field_translation)
            t || self.read_attribute(f.to_sym)
          else
            self.read_attribute(f.to_sym)
          end
        end

        define_method "original_#{f}" do
          self.read_attribute(f.to_sym)
        end

        define_method "original_#{f}=" do |value|
          self.write_attribute(f.to_sym, value)
        end
      end
    end
  end

  private

    def invalid?(attributed)
      attributed[:field_translation].blank?
    end

    def create_default_translation
      default_locale = Language.published.map(&:iso).include?(I18n.locale.to_s) ?
                       I18n.locale.to_s : Language.published.first.iso

      self.class.const_get(:TRANSLATABLE_FIELDS).each do |field|
        translations.create(field_name: field,
                            field_translation: read_attribute(field.to_sym),
                            locale: default_locale)
      end
    end

end