class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :street
      t.string   :town_or_city
      t.string   :country
      t.string   :additional
      t.string   :postcode
      t.datetime :created_at
    end
    add_index :addresses, [:item_type, :item_id]
  end

  def self.down
    remove_index :addresses, [:item_type, :item_id]
    drop_table :addresses
  end
end
