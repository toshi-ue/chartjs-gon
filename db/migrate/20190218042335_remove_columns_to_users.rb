class RemoveColumnsToUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :category, index: true, foreign_key: true
    remove_reference :users, :subcategory, index: true, foreign_key: true
  end
end
