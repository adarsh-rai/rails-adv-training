Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :registrations do
        collection do
          post :sign_up
        end
      end

      resources :users
    end
  end 
end
