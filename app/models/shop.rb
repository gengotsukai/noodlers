class Shop < ApplicationRecord
	has_many :shop_comments
	has_many :shop_likes
	belongs_to :user
	belongs_to :genre
	def favorited_by?(user)
		shop_likes.where(user_id: user.id).exists?
    end
end
