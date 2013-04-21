class Meteor < ActiveRecord::Base
  default_scope :order => "id DESC"
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  attr_accessible :address, :description, :ending, :photo, :starting, :subtitle, :the_geom, :title, :hashtag
  has_many :wishes
  has_many :mobile_users, :through => :wishes 

  before_create :send_meteor


  # Esta función tiene las siguientes responsabilidades
  # * Ir buscando los siguientes ids para insertar en la base de datos
  def self.get_new_event _id
    year = Time.now.year
    url = "http://www.amsmeteors.org/members/kml/view_event_kml?event_id=#{_id}&event_year=#{year}"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    Report.from_kml xml_data.to_s, _id
  end

  def send_meteor
    MobileUser.all.each do |mobile_user|
      mobile_user.apn_devices.each do |apn_device|
        logger.debug apn_device
        n = APN::Notification.new
        n.device_id = apn_device.id
        n.alert = 'Tienes una nueva notificacion de meteorito'
        n.save
      end
      APN::Notification.send_notifications
    end
  end

end
