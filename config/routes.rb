Rails.application.routes.draw do

  # URLS ===================================================================================================

  # Define the root of the webpage
  root 'static_pages#home'

  get     '/about',                          to: 'static_pages#about'
  get     '/get-involved',                   to: 'users#new'
  get     '/what-we-do',                     to: 'static_pages#what_we_do', as: "what_we_do"
  get     '/contact',                        to: 'static_pages#contact'
  post    '/contact',                        to: 'contact_forms#create'
  get     '/what-we-do/vow-of-silence',      to: 'static_pages#vow_of_silence', as: "vow_of_silence"
  get     '/what-we-do/ee-dance-challenge',  to: 'static_pages#ee_dance_challenge', as: "ee_dance_challenge"
  get     '/what-we-do/mini-we-day',         to: 'static_pages#mini_we_day', as: "mini_we_day"
  get     '/login',                          to: 'sessions#new'
  post    '/login',                          to: 'sessions#create'
  delete  '/logout',                         to: 'sessions#destroy'
  delete  '/documents',                      to: 'documents#destroy'
  get     '/auth/:provider/callback',        to: 'sessions#create_with_api'
  get    '/home/signup',                     to: 'users#sign_up_for_event'
  get    '/home/optout',                     to: 'users#opt_out_of_event'
  get    '/home/make_exec',                  to: 'users#make_exec'
  get    '/home/unmake_exec',                to: 'users#unmake_exec'
  get    '/home/delete_article_picture',     to: 'articles#delete_picture'

  # RESOURCES ==============================================================================================
  resources :users,               except: [:show]              
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :events
  resources :articles,            only: [:index, :create, :update, :destroy, :edit, :show]
  resources :documents,           only: [:index, :create, :destroy]
  resources :fundraisers,         only: [:create, :edit, :update, :destroy] 
  
end
