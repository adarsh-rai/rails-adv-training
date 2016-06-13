module Api
	module V1
		class Api::V1::UsersController < Api::V1::BaseController
			 #before_action :set_user

				  # GET /users
				  # GET /users.json
				  def index
				  	p request.headers[:HTTP_EMAIL]
				  	p request.headers[:HTTP_OUTH_TOKEN]
				    @users = User.all
				    if @users.present?

				    render json: @users
					else
						render json: {:message => "Nothing Found"}
					end

				  end

				  # GET /users/1
				  # GET /users/1.json
				  def show
				    render json: @user
				  end

				  # POST /users
				  # POST /users.json
				  def create
				    @user = User.new(user_params)

				    if @user.save
				      render json: @user
				    else
				      render json: @user.errors
				    end
				  end

				  # PATCH/PUT /users/1
				  # PATCH/PUT /users/1.json
				  def update
				    @user = User.find(params[:id])

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
