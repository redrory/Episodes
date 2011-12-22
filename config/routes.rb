Episodes::Application.routes.draw do
  devise_for :users

  get "episodes/index"
  get "episodes/watch"

  root :to => 'Episodes#index'
  resources :episodes

  match 'watch' => 'Episodes#watch'
end
