class TwilioController < ApplicationController
  include Webhookable
  
  skip_before_action :verify_authenticity_token
 
  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end
 
    render_twiml response
  end
  
  def incoming
    response = Twilio::TwiML::Response.new do |r|
      r.Dial  do |d|
        d.Client 'jenny'
      end
    end

    render :text => response.text
  end
  
  def index
  end
end