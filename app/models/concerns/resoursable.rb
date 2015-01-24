module Resoursable
  extend ActiveSupport::Concern

  included do
    # relations, callbacks, validations, scopes and others...
    scope :published, -> { where(published: true) } 
  end

  def publish
    self.update(published: !self.published)
  end

  def translatable?
    respond_to? :translations
  end

  module ClassMethods

  end

end