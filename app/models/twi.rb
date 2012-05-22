class Twi < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def create_with_omniauth(auth)
    create!do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]

      user.name = auth["info"]["nickname"]
    end
  end
end
