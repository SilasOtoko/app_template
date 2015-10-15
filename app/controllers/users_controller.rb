class UsersController < ApplicationController
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
      flash[:notice] = "You are registered"
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
  
  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
  end
end