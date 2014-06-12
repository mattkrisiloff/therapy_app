class ChatController < ApplicationController
  
  def new
    chat = Chat.new
    chat.owner = ChatUser.user(session)
    chat.owner.update_attributes(:time_zone => cookies["jstz_time_zone"])
    if chat.save
      chat_tiny = Tiny::tiny(chat.id)
        chat.channel = "message_channel_" + chat.id.to_s
        chat.save
      redirect_to :action => "view", :id => chat_tiny
    end
  end

  def view
    
    if(params[:id] != nil)
      @chat = Chat.find(Tiny::untiny(params[:id]))
      @user = ChatUser.user(session)
      #@user.update_attributes(:time_zone => cookies["jstz_time_zone"])
      @messages = Message.where("chat_id = ?", @chat.id.to_s).load
    else
      redirect_to :controller => 'index', :action => 'index'
    end
    
  end

end