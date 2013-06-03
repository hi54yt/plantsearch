class CreateTrsfsyxdjs < ActiveRecord::Migration
  def change
    create_table :trsfsyxdjs do |t|
      t.integer :plant_id
      t.string :level

      t.timestamps
    end
  end
end
