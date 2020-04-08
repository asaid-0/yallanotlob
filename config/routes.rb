Rails.application.routes.draw do

  resources :items


  resources :orders
  root 'home#index'
  

  post 'groups_users' , to: 'groups_users#create'
  delete 'groups_users/destroy/:id' , to: 'groups_users#destroy', as: :remove_user



  resources :groups
  
  delete 'orders_users/destroy/:id' , to: 'orders_users#destroy', as: :remove_invitation


  resources :friends


    # get '/auth/:provider/callback', to: 'users/omniauth_callbacks#facebook'

  get  'users/index',to:"users#index"
  get 'search/groups', to: "orders#searchGroups"
  get 'search/friends', to: "orders#searchFriends"
  get 'notifications', to: "orders#notifications"
  get 'orders/:invitation_id/join', to: "orders#join"
  devise_for :users, controllers: 
        { sessions: 'users/sessions' ,
          registrations: 'users/registrations',
          passwords: 'users/passwords',
          confirmations: 'users/confirmations',
          unlocks: 'users/unlocks',
          omniauth: 'users/omniauth',
          :omniauth_callbacks => "users/omniauth_callbacks" 
        }
        
end
