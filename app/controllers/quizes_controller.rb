class QuizesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index]
  before_action :admin_user, only: [:new, :create]
  
  
  def show
    @quize = Quize.find(params[:id])
  end
  
  
  def new
    @quize = Quize.new
  end
  
  def create
    @quize = Quize.new(quize_params) 
    if @quize.save
      flash[:success] = "New Quiz Created"
      render 'new'
    else
      render 'new'
    end
  end
  
  
  
  def index
    @quizes = Quize.all
  end
  
  def destroy
    Quize.find(params[:id]).destroy
    flash[:success] = "Quiz deleted"
    redirect_to quizes_url
  end
  
  def edit
    @quize = Quize.find(params[:id])
  end
  
  def update
    @quize = Quize.find(params[:id])
    if @quize.update_attributes(quize_params)
      flash[:success] = "Quiz Updated"
      redirect_to @quize
    else
      render 'edit'
    end
  end
  
  
  private
  
    def quize_params
      params.require(:quize).permit(:name, :description)
    end

    # Before filters
    
    # confims a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # confrims an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
  
end
