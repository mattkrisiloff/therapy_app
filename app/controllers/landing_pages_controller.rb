class LandingPagesController < ApplicationController
  
  def online_therapy
    @client = Client.new
  end
  
  def online_counseling
    @client = Client.new
  end
  
  def therapist
    @client = Client.new
  end
  
  def depression_counseling
    @client = Client.new
  end
  
  def depressed
    @client = Client.new
  end
  
  def depression
    @client = Client.new
  end
  
  def sorry
    @emails = EmailBox.new
  end
end
