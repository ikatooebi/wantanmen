class Address < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :prefecture, :user_id
  belongs_to :user

  validates :prefecture, presence: true, uniqueness: {scope: :user_id}
  #validates :user_id, presence: true

  scope :pres, conditions:  "user_id is NOT NULL" 
end
