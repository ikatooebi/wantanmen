class Address < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :prefecture, :user_id
  belongs_to :user

  validates :prefecture, presence: true#, uniqueness: {scope: :user_id}
  #validates_uniqueness_of :prefecture, :scope => :user_id

  scope :pres, conditions:  "user_id is NOT NULL" 
end
