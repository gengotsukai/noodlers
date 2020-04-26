class Shop < ApplicationRecord
	has_many :shop_comments
	has_many :shop_likes
	belongs_to :user
	belongs_to :genre

	validates :user_id, presence: true
    #validates :genre_id, presence: true
end
