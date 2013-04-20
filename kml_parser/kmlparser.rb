require 'net/http'
require 'rexml/document'

url = 'http://www.amsmeteors.org/members/kml/view_event_kml?event_id=895&event_year=2013'
xml_data = Net::HTTP.get_response(URI.parse(url)).body

doc = REXML::Document.new(xml_data)

doc.elements.each('kml/Document/Folder/Folder/Folder/Placemark') do |ele|
  print ele.to_s
end


#puts doc
