class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_reference :items, :category, index: true, foreign_key: true
    add_reference :items, :subcategory, index: true, foreign_key: true
  end
end
