Episodes::Application.routes.draw do
  devise_for :users

  get "episodes/index"
  get "episodes/watch"
  get "episodes/login"

  root :to => 'Episodes#login'
  resources :episodes

  match 'watch' => 'Episodes#watch'
  match 'login' => 'Episodes#login'
end
