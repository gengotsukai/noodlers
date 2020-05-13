FactoryBot.define do
  factory :user do
  	nickname { "test" }
    email { "test@user" }
    password { "000000" }
  end
  #モデル名以外の変数名を付ける場合は、classを指定し、以下のように記述をする（この場合、変数名は"another_user"になる）
  factory :another_user, class: User do
  	nickname { "test1" }
    email { "test1@user1" }
    password { "111111" }
  end
end
