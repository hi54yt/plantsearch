class CreateGsydjs < ActiveRecord::Migration
  def change
    create_table :gsydjs do |t|
      t.integer :plant_id
      t.string :level

      t.timestamps
    end
  end
end
