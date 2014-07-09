class ChatsController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_filter :authenticate_user!, :except => [:view, :test]
  
  include SessionsHelper
  
  def new
    puts "creating new chat"
    chat = Chat.new
    chat.owner = ChatUser.user(session)
    chat.owner.update_attributes(:time_zone => cookies["jstz_time_zone"])
    if chat.save
      chat_tiny = Tiny::tiny(chat.id)
      puts "chat id is #{chat.id}"
        chat.channel = "message_channel_" + chat.id.to_s
        chat.save
      redirect_to :action => "view", :id => chat_tiny
    end
  end

  def view
    if !user_signed_in?
      deny_access
    else
      @chat = Chat.find(Tiny::untiny(params[:id]))
      session[:chat_id] = @chat.id
      if current_user.role.id == @chat.therapist_id || current_user.role.id == @chat.client_id
    
        if(params[:id] != nil)
          @chat = Chat.find(Tiny::untiny(params[:id]))
          @user = ChatUser.user(session, current_user, @chat)
          @messages = Message.where("chat_id = ?", @chat.id.to_s).load
        else
          redirect_to :controller => 'index', :action => 'index'
        end
      else
        redirect_to unauthorized_chat_path
        flash[:error] = "You are not authorized to enter this chat"
      end
    end
  end
  
  def test
    reset_session
    unless User.find_by(email: 'test@gmail.com').present?
      @test_user = User.create(email: 'test@gmail.com', role_type: "Therapist", password: "password")
      @test_user.role = Therapist.create
    else
      @test_user = User.find_by(email: 'test@gmail.com')
    end
    
    if Chat.find_by(channel: "message_channel_test").nil?
      @chat = Chat.create(channel: "message_channel_test")
    end
    
    @chat = Chat.find_by(channel: "message_channel_test")
    @user = ChatUser.user(session, @test_user, @chat)
    
    @messages = Message.where("chat_id = ?", @chat.id.to_s).load

    if @user.save
      session[:chat_user_id] = @user.id
    else
      redirect_to homepage_path
      flash[:error] = "There was an error opening this chatroom."
    end
  end
  
  def generate
    find_event_and_client_or_build
    puts "making new chat"
    chat = @event.build_chat
    chat.update_attributes(:therapist_id => @event.therapist_id, :client_id => @event.client_id)
    chat.owner = ChatUser.user(session, current_user, chat)
    if chat.save
      chat_tiny = Tiny::tiny(chat.id)
      puts "chat id is #{chat.id}"
      chat.channel = "message_channel_" + chat.id.to_s
      chat.save
      session[:event_id] = nil
      redirect_to :action => "show_my_profile", :controller => "users"
    else
      redirect_to homepage_path
      flash[:error] = "There was an error generating the chatroom"
    end
  end
  
  def unauthorized
  end
end
