module Api
	module V1
		class Api::V1::UsersController < Api::V1::BaseController
		  before_action :authenticate_user
	 	  before_action :set_user, only: [:show, :update, :destroy]


		  # GET /users
		  # GET /users.json
		  def index
		    @users = User.all

		    if @users.present?
			    render json: @users
			    #render json: @users.map{|u| {email: u.email, name: u.name} }
			    #render json: @users.map{|category| {:name => category.name, :email =>  category.email} }	
			else
				render json: {:message => "Nothing Found"}
			end

		  end

		  # GET /users/1
		  # GET /users/1.json
		  def show
		    render json: @user
		  end

		  # PATCH/PUT /users/1
		  # PATCH/PUT /users/1.json
		  def update
		    if @user.update(user_params)
		      head :no_content
		    else
		    end
		  end

		  # DELETE /users/1
		  # DELETE /users/1.json
		  def destroy
		    @user.destroy

		    head :no_content
		  end

		  private

		    def set_user
		      @user = User.find(params[:id])
		    end

		    def user_params
		      params.permit(:name, :email, :password)
		    end

		end

	end
	
end
