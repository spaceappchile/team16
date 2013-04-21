class Report < ActiveRecord::Base
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  belongs_to :meteor
  attr_accessible :experience, :location, :name, :the_geom, :witness, :meteor_id, :hashtag

  def self.from_kml kml, meteor_id
    hash = Hash.from_xml kml
    reg = /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/
    event_name = hash['kml']['Document']['name']
    hash = Hash.from_xml kml
    meteor = Meteor.find_by_id(meteor_id)

    folder = hash['kml']['Document']['Folder'][0]['Folder']

    unless folder.kind_of?(Array)
      folder = Array.new [folder]
    end 

    factory = Meteor.rgeo_factory_for_column :the_geom

    folder.each do |folder|

      experience = folder['name'].match(/\d{1,}/).to_s.to_i
      ## Ahora vienen los reportes!!!
      unless folder['Placemark'].kind_of?(Array)
        folder['Placemark'] = Array.new [ folder['Placemark'] ]
      end

      folder['Placemark'].each do |placemark|
        puts placemark
        witness = placemark['name']
        snippet = placemark['Snippet'] # "Time: 22:10:00 - Bullhead City, AZ" 
        location = snippet.split[3..snippet.length].join(" ")

        coordinates = placemark['Point']['coordinates'] # {"coordinates"=>"-114.53091929696,35.142340873613,0"
        puts coordinates
        x = coordinates.split(",")[0]
        y = coordinates.split(",")[1]

        created_at = placemark['description'].match(reg).to_s.to_datetime    
        hashtag = event_name.gsub("#", "").gsub("Year:", "").gsub(" - ", "").split.join("_") 
        hashtag = "##{hashtag}"
         
        unless meteor
          #meteor = Meteor.create
          meteor = Meteor.create :description => witness, :title => hashtag, :address => location, :subtitle => event_name
        end
        the_geom = factory.point(x, y)
        puts the_geom
        Report.create :name => event_name, :experience => experience, :witness => witness, :meteor_id => meteor.id, :the_geom => the_geom
      end
    end
  end
end
