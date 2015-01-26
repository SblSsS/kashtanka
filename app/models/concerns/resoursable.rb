module Resoursable
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where(published: true) } 
  end

  def publish
    self.update(published: !self.published)
  end

  def translatable?
    respond_to? :translations
  end

  module ClassMethods
    def sort field, order
      all.order("#{self.table_name}.#{field} #{order}")
    end
  end

end