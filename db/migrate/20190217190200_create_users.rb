class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.time :withdrawal

      t.timestamps
    end
  end
end
