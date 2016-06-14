 module Api 
      module V1       

        class Api::V1::RegistrationsController < Api::V1::BaseController

          # POST /users
          # POST /users.json
          def sign_up
            @user = User.new(user_params)
            
            if @user.save
              render json: @user
            else
              render json: @user.errors
            end
          end

          private
            def user_params
              params.permit(:name, :email, :password)
            end
        end
     end
  end      
