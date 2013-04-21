class Report < ActiveRecord::Base
  belongs_to :meteor
  attr_accessible :experience, :location, :name, :the_geom, :witness


  def self.from_kml kml
    hash = Hash.from_xml kml
    reg = /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/
    event_name = hash['kml']['Document']['name']

    hash = Hash.from_xml kml
    
  
    
    
    
    hash['kml']['Document']['Folder'][0]['Folder'].each do |folder|
      experience = folder['name'].match(/\d{1,}/).to_s
      ## Ahora vienen los reportes!!!
      unless folder['Placemark'].kind_of?(Array)
        folder['Placemark'] = Array.new [ folder['Placemark'] ]
      end

      folder['Placemark'].each do |placemark|
        witness = placemark['name'] # "Janice  T. " 
        snippet = placemark['Snippet'] # "Time: 22:10:00 - Bullhead City, AZ" 
        location = snippet.split[3..snippet.length].join(" ")
        caordinates = placemark['Point']['coordinates'] # {"coordinates"=>"-114.53091929696,35.142340873613,0"
        created_at = placemark['description'].match(reg).to_s.to_datetime    
        
        if experience.empty?
          return false
        else
          Report.create :name => event_name, :experience => experience, :witness => witness
        end
      end
    end
  end
end
