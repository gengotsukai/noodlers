class Genre < ApplicationRecord
	has_many :user_genres
	has_many :shops

  	validates :user_id, presence: true
end
