Rails.application.routes.draw do  
  namespace 'api' do       
    namespace 'v1' do  
      mount_devise_token_auth_for 'User', at: 'auth'     
      resources :bills
      resources :students      
      resources :enrollments
      
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    end
  end
end
