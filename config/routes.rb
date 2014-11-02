Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'activities#index'
  resources :knowledges
  resources :activities do
    get :autocomplete_approved_knowledge_name, on: :collection
  end

end
