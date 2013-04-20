require 'net/http'
require 'rexml/document'

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

registros = []

doc.elements.each('kml/Document/Folder') do |element|

  if element.get_elements('name').first.to_s == "<name>Witnesses</name>"
    element.elements.each('Folder') do |wraf|
      registro = {
        'nombre' => puts wraf.get_text('name').to_s
      }
    end
  end

  registros << registro
end

puts registros.to_s
