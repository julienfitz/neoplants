Rails.application.routes.draw do
  resources :plants

  get '/' => 'plants#index'
end
