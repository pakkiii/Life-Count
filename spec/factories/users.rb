FactoryBot.define do
  factory :user do
    nick_name { '狂四郎' }
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end