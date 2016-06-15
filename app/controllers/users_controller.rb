class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(users_params)
  	if @user.save
  		redirect_to users_path
  	else
  		flash[:notice] = @user.errors.full_messages[0]
      render "new"
  	end
  end

  def edit

  end

  def update
    if @user.update_attributes(users_params)
      redirect_to users_path
    else
      flash[:notice] = @user.errors.full_messages[0]
      render "edit"
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

  	def users_params
  		params.require(:user).permit(:name, :email, :password)
  	end

end