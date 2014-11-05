Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # resources :users
  get '/users/:id', to: 'users#show', as: 'user'
  root 'activities#index'
  resources :knowledges
  resources :activities do
    get :autocomplete_approved_knowledge_name, on: :collection
  end

end
