module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter params
      result = all
      
      params.each do |key,value|
        result = result.public_send(key,value) if !value.blank?
      end

      result
    end
  end

end