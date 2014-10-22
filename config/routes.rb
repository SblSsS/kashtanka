Kashtanka::Application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'registration' }
  
  root to: 'client/home#index'

  namespace :client do
  end

  namespace :admin do
  end

end
