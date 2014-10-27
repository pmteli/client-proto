class Meter < ActiveRecord::Base
  self.table_name = "meter"

  def desc
    building = Building.find_by_building_id(self.building_id)
    return building.building_name
  end


end
