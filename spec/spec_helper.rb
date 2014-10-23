require 'simplecov'
SimpleCov.start
# require 'codeclimate-test-reporter'
# CodeClimate::TestReporter.start

require 'capybara/rspec'
require 'factory_girl_rails'
require 'database_cleaner'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.around(:each) do |example|
    FactoryGirl.reload
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end
end

def sign_in_with(email, password)

  visit new_user_session_path

  fill_in 'Email', with: email
  fill_in 'Пароль', with: password
  click_button 'Войти'
  visit root_path
end

