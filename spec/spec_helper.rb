# require 'devise'
require 'capybara/rspec'
require 'factory_girl_rails'
require 'database_cleaner'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.after(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
end

def sign_in(user = create(:user))

  visit "/"
  click_link "Вход"

  fill_in "Email", with: user.email
  fill_in "Пароль", with: user.password
  click_button "Войти"

  visit "/"

  expect(page).to have_content("Выход")
end
