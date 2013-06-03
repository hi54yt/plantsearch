class Gsydj < ActiveRecord::Base
  attr_accessible :level, :plant_id
  belongs_to :plant
end
