module Resoursable
  extend ActiveSupport::Concern

  included do
    # relations, callbacks, validations, scopes and others...
    scope :published, -> { where(published: true) } 
  end

  def publish
    self.update(published: !self.published)
  end

  module ClassMethods

  end

end