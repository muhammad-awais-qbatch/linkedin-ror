class ConnectionsController < ApplicationController
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
    @user = User.find(session[:current_user]['id'])
    @id = params['id']
    # @skills = []
    if @user.reciever_connections.where(sender_id: @id, status:'Confirmed').first || @user.sender_connections.where(reciever_id: @id, status:'Confirmed').first
      @skills = User.find(@id).skills
    else 
      redirect_to "/connections", status: 404
    end
  end

end
