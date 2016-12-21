Rails.application.routes.draw do

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end
    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end
  
  resources :blogs, path: "blog"
  get 'business_leads', to: 'business_leads#index'
  resources :business_leads 
  resources :callstats
  resources :charges
  resources :citations
  resources :citation_sources
  resources :cities
  resources :companies
  resources "contacts", only: [:new, :create]  
  resources :machines
  resources :properties
  resources :subscriptions
  
  get 'bye',                          to: 'static#bye'  
  get 'clients',                      to: 'static#clients'
  get 'contact-us',                   to: 'static#contact'
  get 'dashboard',                    to: 'static#dashboard'
  get 'free-marketing-consultation',  to: 'static#freeconsult'
  get 'privacy-policy',               to: 'static#privacy'
  get 'refunds',                      to: 'static#refunds'
  get 'tos',                          to: 'static#tos'

  post 'twilio/voice' => 'twilio#voice'
  post 'twilio/logger' => 'twilio#logger'

  devise_for :users
  
  root 'static#home'
end
