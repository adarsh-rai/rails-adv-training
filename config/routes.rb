Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resource :registrations do
        collection do
          post :sign_up
        end
      end
      resource :sessions do
        collection do
          post :sign_in
        end
      end

      resources :users
    end
  end 

  resources :users

  root "welcome#index"
end
