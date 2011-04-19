module Digs
  module Addressable
    extend ActiveSupport::Concern

    module ClassMethods
      def is_addressable
        self.has_one :address, :as => :addressable, :dependent => :destroy 
        accepts_nested_attributes_for :address
        attr_accessor :street, :town_or_city, :county, :postcode, :country, :additional
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

ActiveRecord::Base.send :include, Digs::Addressable
