module Digs
  class Address < ActiveRecord::Base
    UK_COUNTRIES = ["Northern Ireland", "England", "Scotland", "Wales"]
    PRIORITY_COUNTRIES = ["Ireland"] + UK_COUNTRIES
    
    belongs_to :addressable, :polymorphic => true
    validates_presence_of     :country # specific for autoregister, TODO extract out?
    validates_length_of       :street, :in => 1..100, :allow_nil => true, :allow_blank => true
    validates_length_of       :town_or_city, :in => 1..50, :allow_nil => true, :allow_blank => true
    validates_length_of       :additional, :maximum => 100, :allow_nil => true, :allow_blank => true
    
    # Validate postcode if a uk address
    validates_presence_of     :postcode, :if => :should_validate_postcode?
    validates :postcode, :uk_postcode => true, :if => :uk?, :allow_nil => true, :allow_blank => true
    
    def self.priority_countries; PRIORITY_COUNTRIES; end
    def self.uk_countries; UK_COUNTRIES; end  
    
    def uk?
      UK_COUNTRIES.include? self.country
    end
    
    def should_validate_postcode?
      self.uk? && self.postcode.nil? && self.postcode.blank?
    end
  end
end
