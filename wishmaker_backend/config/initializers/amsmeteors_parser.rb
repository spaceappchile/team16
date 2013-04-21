# Please put here your AMSMETEOR PARSER into a new Thread

Meteor.create :title => "initializer"



Thread.new do
  while true
    kml = Meteor.get_new_event
    Report.from_kml kml
    sleep(60.0)
  end
end
