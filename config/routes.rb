Kashtanka::Application.routes.draw do

  root to: 'client/home#index'

  namespace :client do
  end

  namespace :admin do
  end

end
