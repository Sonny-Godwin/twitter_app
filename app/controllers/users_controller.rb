class UsersController < ApplicationController
  
  ## New Method
  def new
    @user = User.new
  end
  
  ## Show Method
  def show
    @user = User.find(params[:id])
  end
  
  ## Create Method
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end  
  end
  
  ## Define Private Parameters  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
