class Wish < ActiveRecord::Base
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  belongs_to :mobile_user
  belongs_to :meteor
  attr_accessible :description, :made, :mobile_user_id, :meteor_id
end
