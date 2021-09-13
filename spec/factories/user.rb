FactoryBot.define do
    factory :user do
      id {1}
      name {"user"}
      email {'user1@gmail.com'}
      password {"password"}
      is_admin {false}
    end
    factory :second_user, class: User do
      id {2}
      name {"admin"}
      email {'admin1@gmail.com'}
      password {"password"}
      is_admin {true}
    end
  end

