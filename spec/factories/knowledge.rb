# This will guess the User class
FactoryGirl.define do
  factory :knowledge do
    name "Rails 4 Way"
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
     Voluptates enim unde, numquam est quidem nobis animi blanditiis, laboriosam
     mollitia sit alias necessitatibus sequi deleniti voluptatibus velit eaque
     neque, odit deserunt. Est soluta, labore blanditiis deserunt quasi commodi
     quos optio, itaque minus reiciendis corporis quibusdam eum voluptatibus
     sequi nostrum amet assumenda?"
    link "http://leanpub.com"
    kind %w(Книга Скринкаст).sample
  end
end