require 'net/http'
require 'rexml/document'
require 'active_support'
require 'rubygems'
require 'bundler'
require 'active_support/core_ext'
require 'pp'

url = 'http://www.amsmeteors.org/members/kml/view_event_kml?event_id=895&event_year=2013'
xml_data = Net::HTTP.get_response(URI.parse(url)).body

doc = REXML::Document.new(xml_data)

#
# Los datos que necesitamos
# - Nombre del evento, con el número
# - Fecha del evento
# - Latitud
# - Longitud
# - Locacion
# - Experiencia
#
session = Hash.from_xml(xml_data)
puts session.kml.keys


registros = []

doc.elements.each('kml/Document/Folder') do |element|

	if element.get_elements('name').first.to_s == "<name>Witnesses</name>"
		element.elements.each('Folder') do |wraf|
			puts "#{wraf.get_text('name')}"

			registros << {
				:nombre => "#{wraf.get_text('name')}",
			}



			

		end
	end

end

puts registros.to_s
