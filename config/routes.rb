Rails.application.routes.draw do
  devise_for :agents
  root to: "payments#index"

  resource :home
  resources :payments
  resources :statements
end
