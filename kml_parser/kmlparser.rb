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

#  if element.get_elements('name').first == "Witnesses"
#    print "wwww"
#  end

  #registro = {
  #  'nombre' => element.get_elements('name').first.to_s
    #'fecha'  => element.to_s
    #'latitud' => element.to_s
    #'longitud' => element.to_s
    #'locacion' => element.to_s
    #'experiencia' => element.to_s
  #}

#  registros << registro
end

print registros.to_s


#doc.elements.each('kml/Document/Folder/Folder/Folder/Placemark') do |ele|
#  print ele.to_s
#end


#puts doc
