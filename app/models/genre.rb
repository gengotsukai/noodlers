class Genre < ApplicationRecord
	belongs_to :user
	has_many :user_genres
	has_many :shops

end
