class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string   :addressable_type, :null => false
      t.integer  :addressable_id,   :null => false
      t.string   :street
      t.string   :town_or_city
      t.string   :country
      t.string   :additional
      t.string   :postcode
      t.datetime :created_at
    end
    add_index :addresses, [:addressable_type, :addressable_id]
  end

  def self.down
    remove_index :addresses, [:addressable_type, :addressable_id]
    drop_table :addresses
  end
end
