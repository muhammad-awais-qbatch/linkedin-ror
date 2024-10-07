class LoginController < ApplicationController
  
  skip_before_action :authenticate, except: [:delete]
  before_action :redirect_if_user, except: [:delete]
  def index
  end
  def new
  end

  def validate
    # puts "Username: ", params[:login][:username], " Password: ", params[:login][:password_digest]
    # @user = User.where(username: params[:login][:username], password_digest: params[:login][:password_digest]).limit(1)[0]
    @user = User.where(username: params[:login][:username], password_digest: params[:login][:password_digest]).limit(1)[0]

    puts "#{@user}----"

    if @user
      flash[:notice] = ""
      # puts @user, @user.id, @user.name, @user.username, @user.password_digest
      session[:current_user] = @user
      puts session[:current_user]
      redirect_to root_path
    else
      flash[:notice] = "Wrong password or username."
      session.delete(:current_user)
      render :new, status: :unprocessable_entity
    end
    # puts "Okkkkkkkkkk     --------------------------------------> ", params
  end

  def delete
    session.delete(:current_user)
    # render :js => "alert('Logout successfully');"
    flash[:alert] = "Logout successfully"
    redirect_to login_path
  end

  def redirect_if_user
    if session[:current_user]
      redirect_to root_path
    end
  end
end
