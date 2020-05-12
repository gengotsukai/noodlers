class Genre < ApplicationRecord
	belongs_to :user
	has_many :user_genres
	has_many :shops

	validates :genre_name, presence: true, length: {maximum: 10}

end
