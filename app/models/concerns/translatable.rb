module Translatable
  extend ActiveSupport::Concern

  included do
    has_many :translations, as: :translatable
    default_scope { includes(:translations) }
    accepts_nested_attributes_for :translations
  end

  module ClassMethods
    def acts_as_translatable *fields
      fields.each do |f|
        define_method "#{f}" do
          t = self.translations.find_by(field_name: f.to_s, locale: I18n.locale.to_s).try(:field_translation)
          t || self.read_attribute(f.to_sym)
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

end