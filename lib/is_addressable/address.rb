class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  validates_length_of       :street, :in => 1..100, :allow_nil => true, :allow_blank => true
  validates_length_of       :town_or_city, :in => 1..50, :allow_nil => true, :allow_blank => true
  validates_length_of       :additional, :maximum => 100, :allow_nil => true, :allow_blank => true
  
  # Validate postcode if a uk address
  validates_presence_of :postcode, :if => :should_validate_postcode?
  validates :postcode, :postcode => true, :allow_nil => true, :allow_blank => true
  
  def should_validate_postcode?
    self.postcode.nil? && self.postcode.blank?
  end
end
