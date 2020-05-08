class Shop < ApplicationRecord
	has_many :shop_comments
	has_many :shop_likes
	belongs_to :user
	belongs_to :genre

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

