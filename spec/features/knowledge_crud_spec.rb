require 'rails_helper'

feature 'Knowledge CRUD' do
  let(:knowledge) { create :knowledge }
  let(:user) { create :user }
  let(:admin) { create :admin }

  scenario 'User creates new knowledge' do
    sign_in_with(user.email, user.password)

    add_knowledge

    expect(page).to have_content('Знание успешно добавлено')
  end

  scenario 'Admin user updates existing knowledge' do
    sign_in_with(admin.email, admin.password)
    add_knowledge

    visit knowledges_path

    within '.list' do
      first(:link, knowledge.name).click
    end
    click_link 'Редактировать'

    expect(page).to have_content "Редактирование #{knowledge.name}"
  end

  # Реализовать позднее
  # scenario 'Admin user destroy existing knowledge', js: true do
  #   sign_in_with(admin.email, admin.password)

  #   add_knowledge
  #   click_link 'Удалить'
  #   save_and_open_page
  #   expect(page).to have_content('Знание удалено')
  # end

  scenario 'User can\'t see edit link' do
    sign_in_with(user.email, user.password)
    add_knowledge

    expect(page).not_to have_content 'Редактировать'
  end

  def add_knowledge
    click_link 'Знания'
    click_link 'Добавить знание'

    fill_in 'Название', with: knowledge.name
    fill_in 'Описание', with: knowledge.description
    fill_in 'Ссылка', with: knowledge.link
    select('Книга', from: 'knowledge[kind]')
    click_button 'Сохранить знание'
  end
end
