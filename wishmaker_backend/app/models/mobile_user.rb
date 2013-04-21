class MobileUser < ActiveRecord::Base
  has_many :apn_devices, :dependent => :delete_all  # attr_accessible :title, :body
  has_many :gcm_devices, :dependent => :delete_all 
  has_many :wishes
  has_many :meteors, :through => :wishes
  attr_accessible :username, :password, :birthday

  before_save :check_for_meteorites


  def check_for_meteorites
    # Check for meteorites
  end

end
