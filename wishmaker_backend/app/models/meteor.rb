class Meteor < ActiveRecord::Base
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  attr_accessible :address, :description, :ending, :photo, :starting, :subtitle, :the_geom, :title
  has_many :wishes
  has_many :mobile_users, :through => :wishes 

  before_save :send_meteor

  def self.get_new_event 
    year = Time.now.year
    id = (Meteor.last) ? Meteor.last.id + 1 : 1;
    url = "http://www.amsmeteors.org/members/kml/view_event_kml?event_id=#{id}&event_year=#{year}"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    Report.from_kml xml_data, id
  end


  def send_meteor
    MobileUser.all.each do |mobile_user|
      # mobile_user.apn_devices.each do |apn_devices|
      mobile_user.apn_devices.each do |apn_device|
        logger.debug apn_device
        n = APN::Notification.new
        n.device_id = apn_device.id
        n.alert = 'Tienes una nueva notificacion de meteorito'
        n.save
      end
      APN::Notification.send_notifications

      mobile_user.gcm_devices.each do |gcm_devices|
        # Do something with gcm_devices
      end
    end
  end

end
