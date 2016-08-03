class StaticPagesController < ApplicationController

  def home
  end

  def about
  end

  def events
  end

  def contact
    @message = ContactFormMessage.new
  end

  def vow_of_silence
  end

  def ee_dance_challenge
  end

  def mini_we_day
  end

  def fundraising
  end
 
end
