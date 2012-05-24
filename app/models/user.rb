class User < ActiveRecord::Base
  image_accessor :cover_image 
  acts_as_paranoid
  attr_accessible :birthday, :kana, :name, :cover_image, :retained_cover_image, :addresses_attributes
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, :allow_destroy => true
  has_many :lends, dependent: :destroy, include: :book
  has_many :rented_book, through: :lends, source: :book
  validates :birthday, presence: true
  validates :kana, presence: true,
    length: {maximum: 255}
  validates :name, presence: true,
    length: {maximum: 255}


  validates_size_of :cover_image, :maximum => 500.kilobytes
  validates_property :format, :of => :cover_image, :in => [:jpg, :png, :gif]

  validates_each :addresses do |record, attr, value|
    uniq_chk = []
    value.each do |a|
      unless a.marked_for_destruction?
        if uniq_chk.index(a.prefecture) 
          record.errors.add attr, 'prefecture_uniq_chk_error' 
        else
          uniq_chk.push(a.prefecture)
        end
      end
    end
  end 

  validates_each :addresses do |record, attr, value|
    cnt = 0
    value.each do |a|
      unless a.marked_for_destruction?
        cnt += 1
      end
    end
    record.errors.add attr, 'prefecture only 3 ' unless cnt == 3
  end

  def renting_books
    lends.now_rentals.map { |lend| lend.book }
  end

  scope :id_is,lambda{|id| where("id like ?", "%#{id}%")}
  scope :name_is, lambda{|name| where("name like ?", "%#{name}%")}
  scope :id_is_or_name_is, lambda{|id,name| where("id like ? or name like ?", "%#{id}%","%#{name}%")}

end
