Rails.application.routes.draw do
  get 'contacts/new'
  post 'contacts/create'
  get 'teamdetails/new'
  post 'teamdetails' => 'teamdetails#create'
  resources :posts
  root 'home#home'
  get 'home' => 'home#home'
  get 'home/terms' => 'home#terms'
  get 'home/privacy' => 'home#privacy'
  get 'home/caution' => 'home#caution'
  get 'home/timeout' => 'home#timeout'

  get 'admins' => 'admins#index'
  get 'admins/seek' => 'admins#seek'
  get 'admins/people' => 'admins#people'
  get 'admins/users/:id/person' => 'admins#person', as: 'person'
  get 'admins/users/:id/person_edit' => 'admins#person_edit', as: 'person_edit'
  patch 'admins/users/:id' => 'admins#update'
  put 'admins/users/:id' => 'admins#update'
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

  get 'application/session_time'
  devise_scope :user do
    match 'active' => 'users/sessions#active', via: :get
    match 'timeout' => 'users/sessions#timeout', via: :get
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :users, except: [:create] do
   collection do
    get 'search'
   end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
