class Lend < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :book_id, :return_day, :user_id
  belongs_to :book
  belongs_to :user
  validates :book_id, presence: true, uniqueness: {scope: :return_day}
  validates :user_id, presence: true

 # validates :book_id, uniqueness: {scope: :return_day}
 # validates_uniqueness_of :book_id, :scope => :return_day,
 #   :message => "lending book!"
#  validates_each :book_id do |record, attr, value|
#    if book = Book.find_by_id(value)
#      record.errors[attr] << 'the lenting book' if book.now_rental?  
#    end
#  end


  scope :now_rentals, conditions: { return_day:nil }
  
  #before_save :hoge
  # def hoge  
  #end  

end
