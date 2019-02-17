class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :amount
      t.references :address, index: true, foreign_key: true

      t.timestamps
    end
  end
end
