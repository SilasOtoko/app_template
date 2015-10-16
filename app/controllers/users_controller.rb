class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have succesfully signed up!"
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def updated
    
  end
  
  def destroy
    
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
  end
  
   def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:error] = "You are not allowed to do that"
      redirect_to dashboard_path
    end
  end
end