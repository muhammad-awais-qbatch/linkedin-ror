class SignupController < ApplicationController
  # def index
  #   @user = User.All
  # end
  skip_before_action :authenticate
  before_action :redirect_if_user
  def new
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.valid?
      session[:current_user] = @user
      redirect_to users_path
      # redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password_digest)
  end

  def redirect_if_user
    if session[:current_user]
      redirect_to root_path
    end
  end
end
