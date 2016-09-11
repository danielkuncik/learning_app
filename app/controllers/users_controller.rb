class UsersController < ApplicationController
  
  def show #renders profile page
    @user = User.find(params[:id])
  end
  
  def new  # redners new user page
    @user = User.new
  end
  
  def create
    flash[:success] = "User Creation Successful"
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :section, :password, :password_confirmation)
  end
  
end
