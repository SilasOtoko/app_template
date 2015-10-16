class PagesController < ApplicationController
  before_action :require_user, only: [:dashboard]
  
  def welcome
    
  end
  
  def dashboard
    @user = current_user
  end
end