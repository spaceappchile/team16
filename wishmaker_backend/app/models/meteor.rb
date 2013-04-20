class Meteor < ActiveRecord::Base
  attr_accessible :address, :description, :ending, :photo, :starting, :subtitle, :the_geom, :title
end
