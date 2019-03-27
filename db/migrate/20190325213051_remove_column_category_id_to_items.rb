class RemoveColumnCategoryIdToItems < ActiveRecord::Migration
  def change
    remove_reference :items, :category, foreign_key: true
  end
end
