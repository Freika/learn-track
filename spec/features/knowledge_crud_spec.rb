require "rails_helper"

feature "Knowledge CRUD" do
  let(:knowledge) {create :knowledge}
  let(:user) {create :user}

  scenario "User creates new knowledge" do
    sign_in user

    click_link "Знания"
    click_link "Добавить знание"

    fill_in "Название", with: knowledge.name
    fill_in "Описание", with: knowledge.description
    fill_in "Ссылка", with: knowledge.link
    fill_in "Вид", with: knowledge.kind
    click_button "Сохранить знание"

    expect(page).to have_content("Знание успешно добавлено")
  end

  scenario "Admin user updates existing knowledge" do

  end

  scenario "Admin user destroy existing knowledge" do

  end
end