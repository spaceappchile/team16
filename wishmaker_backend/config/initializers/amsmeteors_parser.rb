# Please put here your AMSMETEOR PARSER into a new Thread
Thread.new{
  i = 1
  while true
    begin
      Meteor.get_new_event i
      sleep(1.0)
    rescue
      puts "sorry me cai"
    end
    i=i+1
  end
}
