class ChangeToInt < ActiveRecord::Migration
  def change
    change_table :plants do |t|
      t.remove :zhstfwqlpx, :jwzs, :gtsy, :zc, :bctr
      t.integer :zhstfwqlpx
      t.integer :jwzs
      t.integer :gtsy
      t.integer :zc
      t.integer :bctr
    end
  end
end
