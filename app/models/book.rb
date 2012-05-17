class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :name
  
  acts_as_paranoid
  has_many :lends, dependent: :destroy
  has_many :lent_users, through: :lends, source: :user
  validates :author, presence: true,
    length: {maximum: 255}
  validates :isbn, presence: true,
    length: {maximum: 255}
  validates :name, presence: true,
    length: {maximum: 255}
  
  def now_rental?
    lends.now_rentals.size > 0
  end

end
