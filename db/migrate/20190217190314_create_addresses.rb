class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :postalcode
      t.string :name
      t.boolean :current_address
      t.boolean :delivery_address

      t.timestamps
    end
  end
end
