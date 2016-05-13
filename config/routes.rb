Rails.application.routes.draw do

  get '/' => 'home#index'
  get '/index' => 'home#index'
  post '/' => 'home#index'
  post '/index' => 'home#index'

  root 'home#index'
end
