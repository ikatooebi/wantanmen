class User < ActiveRecord::Base
  image_accessor :cover_image 
  acts_as_paranoid
  attr_accessible :birthday, :kana, :name, :cover_image, :retained_cover_image, :addresses_attributes
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses 
  has_many :lends, dependent: :destroy, include: :book
  has_many :rented_book, through: :lends, source: :book
  validates :birthday, presence: true
  validates :kana, presence: true,
    length: {maximum: 255}
  validates :name, presence: true,
    length: {maximum: 255}
// 
  def renting_books
    lends.now_rentals.map { |lend| lend.book }
  end
end
