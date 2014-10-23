FactoryGirl.define do
  factory :activity do
    name 'Rails 3 Way'
    comment Faker::Lorem.sentence
    link 'http://leanpub3.com'
    kind %w(Книга Скринкаст).sample
    time_spent 3
  end

end
