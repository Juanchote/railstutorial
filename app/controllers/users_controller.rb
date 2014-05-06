class UsersController < ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end

  def create
	  @user = User.new(user_params)
	  if @user.save
		  flash[:notice] = "Added User!!!"
		  redirect_to @user
	  else
		  flash[:danger] = "Error!!"
		  render 'new'
	  end
  end

  def show
	  @user = User.find(params[:id])
  end

  private

  def user_params
	  params.require(:user).permit(:name, :email, :password,
	                               :password_confirmation)
  end
end
