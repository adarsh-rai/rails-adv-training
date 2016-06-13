module Api
	module V1
		class BaseController < ApplicationController
			include AbstractController::Callbacks
		    include ActionController::RackDelegation
		end

	end
	
end
