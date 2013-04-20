class Wish < ActiveRecord::Base
  belongs_to :user
  belongs_to :meteor
  attr_accessible :description, :made
end
