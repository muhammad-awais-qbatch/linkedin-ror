class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include ActionController::Live
  before_action :authenticate
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  private
  def authenticate
    # if session[:current_user]
    redirect_to login_path unless session.include? :current_user
      
    # else
    #   redirect_to root_path
    # end
  end
      
end
