Rails.application.routes.draw do

  get 'alert/new'


  get 'alert/create'
  post 'alert/create' => 'alert#create'

  get 'alert/update'

  get 'alert/edit'

  get 'alert/destroy'

  get 'alert/index'

  get 'alert/show'

  # namespace :api do
  #   namespace :v1 do
  #     resources :productOp, :path => "product", :defaults => { :format => 'json' }
  #   end
  # end

  get '/' => 'home#index'
  get '/index' => 'home#index'
  post '/' => 'home#index'
  post '/index' => 'home#index'

  root 'home#index'
end
