Rails.application.routes.draw do
  get 'teamdetails/new'
  post 'teamdetails' => 'teamdetails#create'
  # get '/posts' => 'posts#index'
  # get '/posts/new' => 'posts#new'
  # post '/posts' => 'posts#create'
  # get '/posts/:id' => 'posts#show'
  resources :posts
  root 'home#home'
  get 'home' => 'home#home'


  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

resources :users, except: [:create] do
  collection do
    get 'search'
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
