 module Api 
      module V1       

        class Api::V1::RegistrationsController < Api::V1::BaseController

          # POST /users
          # POST /users.json
          def sign_in
           @user=User.find_by(email: params[:email]).try(:authenticate, params[:password])
           if @user
            @user.outh_token = SecureRandom.hex
            @user.save
            render json: @user
          else
            render json: {:message "Invalid username password"}
          end
          end

          private
            def user_params
              params.permit(:name, :email, :password)
            end
        end
     end
  end      
