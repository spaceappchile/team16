class ApnDevice < ActiveRecord::Base
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  belongs_to :mobile_user
  # attr_accessible :title, :body
end
