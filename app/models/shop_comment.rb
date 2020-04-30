class ShopComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :opinion, presence: true
 end
