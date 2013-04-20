class Meteor < ActiveRecord::Base
  attr_accessible :address, :description, :ending, :photo, :starting, :subtitle, :the_geom, :title
  has_many :wishes
  has_many :users, :through => :wishes 
end
