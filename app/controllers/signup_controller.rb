class SignupController < ApplicationController
  # def index
  #   @user = User.All
  # end
  skip_before_action :authenticate
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password_digest)
  end
end
