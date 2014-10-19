require "rails_helper"

feature "User registration" do
  let(:user) {create :user}
  scenario "Guest fills registration fields and click sign up button" do
    visit "/"
    click_link "Регистрация"

    fill_in "Email", with: "test@test.ru"
    fill_in "Пароль", with: user.password
    fill_in "Подтвердите пароль", with: user.password
    click_button "Зарегистрироваться"

    expect(page).to have_text("Добро пожаловать! Вы успешно зарегистрировались.")
  end
end