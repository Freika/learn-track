require "rails_helper"

feature "Knowledge CRUD" do
  let(:knowledge) {create :knowledge}
  let(:user) {create :user}

  scenario "User creates new knowledge" do
    sign_in user

    create_knowledge

    expect(page).to have_content("Знание успешно добавлено")
  end

  scenario "Admin user updates existing knowledge" do
    sign_in user
    create_knowledge

    visit knowledges_path

    within ".list" do
      first(:link, knowledge.name).click
    end

    click_link "Редактировать"

  end

  scenario "Admin user destroy existing knowledge" do

  end

  def create_knowledge
    click_link "Знания"
    click_link "Добавить знание"

    fill_in "Название", with: knowledge.name
    fill_in "Описание", with: knowledge.description
    fill_in "Ссылка", with: knowledge.link
    fill_in "Вид", with: knowledge.kind
    click_button "Сохранить знание"
  end
end