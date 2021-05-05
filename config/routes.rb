Rails.application.routes.draw do
  
  devise_for :users
  get 'home/index'
  post 'jobs/new'
  post 'jobs/destroy'
  resources :jobs
  resources :job_application

  devise_scope :user do
    authenticated :user do
      root 'jobs#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    namespace :v1 do
      resources :jobs
    end
  end 
  
  post 'edit' => "jobs#edit"
  post 'apply' => "jobs#apply"
  get 'applied' => "job_application#index"
  post 'authenticate', to: 'authentication#authenticate'
  get 'authenticate', to: 'authentication#authenticate'
end
