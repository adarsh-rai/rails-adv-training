module Api
	module V1
		class BaseController < ActionController::API
			include AbstractController::Callbacks
		    include ActionController::RackDelegation

		    def authenticate_user
		    	p request.headers[:HTTP_EMAIL]
            	p request.headers[:HTTP_OUTH_TOKEN]

            	user = User.find_by(email: request.headers[:HTTP_EMAIL], outh_token: request.headers[:HTTP_OUTH_TOKEN])
            	return true if user.present?
            	render json: {message: "Please sign in."}, status: 401
		    end

		end

	end
	
end
