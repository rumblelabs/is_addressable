module Digs
  module Addressable
    extend ActiveSupport::Concern
    ADDRESS_ATTRS = [:street, :town_or_city, :county, :postcode, :country, :additional]

    module ClassMethods
      def is_addressable
        self.has_one :address, :as => :addressable, :dependent => :destroy 
        ADDRESS_ATTRS.each { |a| attr_accessor(a) }
        #self.before_validation :create_address
      end
    end
  
    def validate_address
      unless self.address.valid?
        self.address.errors.each do |key,message|
          self.errors.add(key,message)
        end
      end
    end

    def collect_address_attrs
      ADDRESS_ATTRS.inject({}) {|attrs, m| attrs[m] = send(m); attrs }
    end

    def create_address
      if self.new_record?
        self.address = Address.new(self.collect_address_attrs)
      else
        self.address.update_attributes(self.collect_address_attrs)
      end
    end

    def after_initialize        
      if self && self.address && !self.address.nil?
        ADDRESS_ATTRS.each do |m|
          self.send("#{m}=", self.address.send(m))
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Digs::Addressable
