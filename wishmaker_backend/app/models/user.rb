class User < ActiveRecord::Base
  attr_accessible :birthday, :password, :sex, :username
  has_many :wishes
  has_many :meteors, :through => :wishes
end
