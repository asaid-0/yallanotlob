Rails.application.routes.draw do

  resources :items


  resources :orders
  root 'home#index'
  

  post 'groups_users' , to: 'groups_users#create'
  delete 'groups_users/destroy/:id' , to: 'groups_users#destroy', as: :remove_user



  resources :groups
  
  delete 'orders_users/destroy/:id' , to: 'orders_users#destroy', as: :remove_invitation


  resources :friends

  # get '/users' => 'users#index', as: :user_root # creates user_root_path

  # get '/auth/:provider/callback', to: 'users#index'

  get  'users/index',to:"users#index"
  get 'search/groups', to: "orders#searchGroups"
  get 'search/friends', to: "orders#searchFriends"
  devise_for :users, controllers: 
        { sessions: 'users/sessions' ,
          registrations: 'users/registrations',
          passwords: 'users/passwords',
          confirmations: 'users/confirmations',
          unlocks: 'users/unlocks',
          :omniauth_callbacks => "users/omniauth_callbacks" 
        }
        # omniauth: 'users/omniauth',
end
