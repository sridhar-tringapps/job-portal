Rails.application.routes.draw do
  resources :jobs
  resources :job_applications
  devise_for :users
  get 'users/index'
  get 'users/sign_out'
  root to: 'jobs#index'
  namespace :api do
    namespace :v1 do
      resources :jobs
    end
  end 
  post 'apply' => "jobs#apply"
 
end
