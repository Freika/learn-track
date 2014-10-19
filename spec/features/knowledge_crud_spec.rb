require "rails_helper"

feature "Knowledge CRUD" do
  let(:knowledge) {create :knowledge}
  let(:user) {create :user}
  let(:admin) {create :admin}

  scenario "User creates new knowledge" do
    sign_in_with(user.email, user.password)

    add_knowledge

    expect(page).to have_content("Знание успешно добавлено")
  end

  scenario "Admin user updates existing knowledge" do
    sign_in_with(admin.email, admin.password)
    add_knowledge

    visit knowledges_path

    within ".list" do
      first(:link, knowledge.name).click
    end
    click_link "Редактировать"

    expect(page).to have_content "Редактирование #{knowledge.name}"
  end

  scenario "Admin user destroy existing knowledge", js: true do
    sign_in_with(admin.email, admin.password)

    add_knowledge
    click_link "Удалить"
    save_and_open_page
    expect(page).to have_content("Знание удалено")
  end

  scenario "User can't edit existing knowledge" do
    sign_in_with(user.email, user.password)
    add_knowledge
    click_link "Редактировать"

    expect(page).to have_content "Доступ запрещен."
  end

  def add_knowledge
    click_link "Знания"
    click_link "Добавить знание"

    fill_in "Название", with: knowledge.name
    fill_in "Описание", with: knowledge.description
    fill_in "Ссылка", with: knowledge.link
    fill_in "Вид", with: knowledge.kind
    click_button "Сохранить знание"
  end
end