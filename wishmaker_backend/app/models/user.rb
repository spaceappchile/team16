class User < ActiveRecord::Base
  attr_accessible :birthday, :password, :sex, :username
end
