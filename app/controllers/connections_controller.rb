class ConnectionsController < ApplicationController


  skip_before_action :authenticate, except: [:index, :create, :accept]

  def index
    @user = User.find(session[:current_user]['id'])
    @sender_connections = @user.sender_connections
    @reciever_connections = @user.reciever_connections
    
  end
  
  ## GET
  def create
    @connection = Connection.new(sender_id: session[:current_user]['id'], reciever_id: params['id'], status: "Pending")
    if @connection.save
      redirect_to root_path
      return
    end
  end

  def accept
    @connection = Connection.where(reciever_id: session[:current_user]['id'], sender_id: params['id'], status: "Pending").first
    @connection['status'] = "Confirmed"
    if @connection.save
      redirect_to root_path
      return
    end
  end


  def show
    if session[:current_user]
    @user = User.find(session[:current_user]['id'])
    end
    @id = params['id']
    # @skills = []
    if @user && (@user.reciever_connections.where(sender_id: @id, status:'Confirmed').first || @user.sender_connections.where(reciever_id: @id, status:'Confirmed').first)
      @skills = User.find(@id).skills
    elsif @user && User.find(@id)
      @skills = User.find(@id).skills
      @not_a_connection = true
    elsif User.find(@id)
      @skills = User.find(@id).skills
      @not_a_connection = true
      @not_login = true
    else 
      redirect_to "/connections", status: 404
    end
  end

end
