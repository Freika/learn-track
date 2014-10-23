FactoryGirl.define do
  factory :activity do
    name 'Rails 3 Way'
    description 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.
     Voluptates enim unde, numquam est quidem nobis animi blanditiis, laboriosam
     mollitia sit alias necessitatibus sequi deleniti voluptatibus velit eaque
     neque, odit deserunt. Est soluta, labore blanditiis deserunt quasi commodi
     quos optio, itaque minus reiciendis corporis quibusdam eum voluptatibus
     sequi nostrum amet assumenda?'
    link 'http://leanpub3.com'
    kind %w(Книга Скринкаст).sample
    time_spent 3
  end

end
