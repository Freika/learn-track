Rails.application.routes.draw do
  devise_for :users
  root 'activities#index'
  resources :knowledges
  resources :activities do
    get :autocomplete_knowledge_name, on: :collection
  end

end
