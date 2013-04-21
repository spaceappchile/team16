class Meteor < ActiveRecord::Base
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  attr_accessible :address, :description, :ending, :photo, :starting, :subtitle, :the_geom, :title
  has_many :wishes
  has_many :mobile_users, :through => :wishes 


  def self.get_new_event 
    year = Time.now.year
    id = Meteor.last.id
    url = "http://www.amsmeteors.org/members/kml/view_event_kml?event_id=#{id}&event_year=#{year}"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    Report.from_kml xml_data
  end
end
