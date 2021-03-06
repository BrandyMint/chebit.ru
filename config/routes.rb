# -*- coding: utf-8 -*-
Chebit::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :tags, :only=>[:show, :index]

  root :to => "welcome#reports"
  #
  #root :to => redirect('https://www.facebook.com/events/371426619616049/')

  get 'conferences/last/report' => 'welcome#reports'
  get 'conferences/2012_10/report' => 'welcome#report_2012_10'
  get 'conferences/2011_02_10/report' => 'welcome#report_2011_02_10'

  get 'details' => 'welcome#details'
  get "discourse_rating/create"

  resources :conferences, :only=>[:show] do
    resources :comments, :only=>[:create]
    resources :registrations, :only=>[:create, :index]
  end
  #Для создания и редактирования комментариев внутри дискуссий
  resources :discourses do
    resources :comments, :only=>[:create]
    resources :ratings, :only=>[:create], :controller=>:discourse_ratings
  end
  #Для удаления комментариев
  #Для добавления к комментариям комментариев
  resources :comments, :only=>[:destroy] do |item|
     resources :comments, :only=>[:create]
  end
  resources :sections, :only=>[:show]

  devise_for :users
  devise_scope :user do
    resources :users, :only => [:show, :index]
  end

  resources :vacancies

  #Для отображения комментариев после создания
 # match '/discourses/:id/comments'=> redirect('/discourses/%{id}')
  # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-password-


  # resources :users do
  #   member do
  #     get 'show'
  #   end
  # end

  # match 'users/:id' => 'users#show'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
