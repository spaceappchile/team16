# Please put here your AMSMETEOR PARSER into a new Thread
Thread.new{
  while true
    Meteor.get_new_event 
    sleep(1.0)
  end
}
