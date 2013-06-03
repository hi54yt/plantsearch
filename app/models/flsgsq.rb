class Flsgsq < ActiveRecord::Base
  attr_accessible :month, :plant_id
  belongs_to :plant
end
