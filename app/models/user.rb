class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :user_genres
  has_many :shops, dependent: :destroy
  has_many :shop_likes, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 80 }
  validates :email, presence: true
  mount_uploader :image, ImageUploader
  #user modelでdiscardというgemを使用可能にするための記述
  include Discard::Model

  #ユーザーが既に退会しているか・退会していないかを判断し、deviseに伝えるための関数（この関数はdeviseによって呼び出されるもの）
  def active_for_authentication?
    super && !discarded_at
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
