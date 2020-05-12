class Shop < ApplicationRecord
	has_many :shop_comments
	has_many :shop_likes
	belongs_to :user
	belongs_to :genre
  validates :shop_name, presence: true, length: {maximum: 30}
  validates :inquiry, presence: true, length: {maximum: 30}
  validates :address, presence: true, length: {maximum: 50}
  validates :price_range, length: {maximum: 30}
  validates :transport, length: {maximum: 40}
  validates :payment_method, length: {maximum: 30}
  validates :seats_number, length: {maximum: 20}
  validates :cigarette, length: {maximum: 20}


  def favorited_by?(user)
		shop_likes.where(user_id: user.id).exists?
  end
  
  def commented_by?(user)
    shop_comments.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
       Shop.where(['shop_name LIKE ?', "%#{search}%"])
    else
       Shop.all
    end
  end

end

