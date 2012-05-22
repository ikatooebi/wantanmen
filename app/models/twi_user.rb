class TwiUser < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
end
