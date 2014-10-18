require "rails_helper"

feature "User registration" do
  let(:user) {create :user}
  scenario "Guest fills registration fields and click sign up button" do
    visit "/users/sign_up"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button "Зарегистрироваться"

    expect(page).to have_text("Widget was successfully created.")
  end
end