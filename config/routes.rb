Episodes::Application.routes.draw do
  get "episodes/index"

  root :to => 'Episodes#index'
  resources :episodes
end
