Rails.application.routes.draw do
  resources :tickets
  get '/tickets/:id/withdraw', to: 'tickets#withdraw', as: 'withdraw_ticket'
  resources :categories
  resources :roles
  get '/roles/:id/confirm', to: 'roles#confirm', as: 'confirm_role_delete'
  resources :departments
  get '/departments/:id/confirm', to: 'departments#confirm', as: 'confirm_dep_delete'
  devise_for :users
  root to: 'welcome#index', as: 'root'


  # support team routes
  get '/support_panel', to: 'support_team#index', as: 'support_team'
  get '/support_panel/in_progress', to: 'support_team#in_progress', as: 'support_team_in_progress'
  get '/support_panel/closed', to: 'support_team#closed', as: 'support_team_closed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # support team routes
  get '/admin_panel', to: 'admin_team#index', as: 'admin_team'

  # users
  get '/users/:id/profile', to: 'users#profile', as: 'user_profile'
  get '/users', to: 'users#index', as: 'users'
  get '/users/it', to: 'users#it_staff', as: 'it'
  get '/users/dev', to: 'users#dev', as: 'dev'
  get '/users/admin', to: 'users#admin', as: 'admin'
  get '/users/:id/change_role', to: 'users#change_role', as: 'user_change_role'
  put '/users/:id/change_role', to: 'users#change_role_update', as: 'user_change_role_update'

  # image
  get '/users/new_image', to: 'users#new_image', as: 'user_new_image'
  patch '/users/update_image', to: 'users#update_image', as: 'user_update_image'


end
