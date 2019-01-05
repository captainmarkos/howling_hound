FactoryBot.define do
  factory :user, class: User do
    first_name { 'Bugs' }
    last_name  { 'Bunny' }
    email { 'bugsbunny@foo.com' }
  end
end
