class CreateFlsgsqs < ActiveRecord::Migration
  def change
    create_table :flsgsqs do |t|
      t.integer :plant_id
      t.string :month

      t.timestamps
    end
  end
end
