class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  validate :check_number_of_admin_users?

  def check_number_of_admin_users?
  	if AdminUser.all.count > 0
  		#:baseはactive adminのdefaultの仕様上、表示できないため、:emailを使う
  		errors.add(:email, "管理者は一人しか登録できません")
  	end
  end
end
