class Meteor < ActiveRecord::Base
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  attr_accessible :address, :description, :ending, :photo, :starting, :subtitle, :the_geom, :title
  has_many :wishes
  has_many :mobile_users, :through => :wishes 
end
