class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :category, index: true, foreign_key: true
    add_reference :users, :subcategory, index: true, foreign_key: true
  end
end
