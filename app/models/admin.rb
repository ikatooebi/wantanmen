class Admin < ActiveRecord::Base
  attr_accessible :email, :imag_url, :nickname
end
