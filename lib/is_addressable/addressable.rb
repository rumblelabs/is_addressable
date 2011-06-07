module IsAddressable
  module Addressable
    extend ActiveSupport::Concern

    module ClassMethods
      def is_addressable
        self.has_one :address, :as => :addressable, :dependent => :destroy 
        accepts_nested_attributes_for :address
      end
    end
  
    def validate_address
      unless self.address.valid?
        self.address.errors.each do |key,message|
          self.errors.add(key,message)
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, IsAddressable::Addressable
