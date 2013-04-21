class Meteor < ActiveRecord::Base
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  attr_accessible :address, :description, :ending, :photo, :starting, :subtitle, :the_geom, :title
  has_many :wishes
  has_many :mobile_users, :through => :wishes 

  before_create :send_meteor

  def self.get_new_event 
    year = Time.now.year
    id = (Meteor.last) ? Meteor.last.id + 1 : 1;
    url = "http://www.amsmeteors.org/members/kml/view_event_kml?event_id=#{id}&event_year=#{year}"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    Report.from_kml xml_data, id
  end

  def send_meteor

    # MobileUser.all.each do |mobile_user|
      # mobile_user.apn_devices.each do |apn_device|
      APN::Device.all.each do |apn_device|
        logger.debug apn_device
        APN::Notification.delete apn_device.notifications
        n = APN::Notification.new
        n.device_id = apn_device.id
        n.alert = 'A meteor has just passed, would you like to ask for a wish?'
        n.save
      end
      APN::App.send_notifications    # end
  end

end
