class StaticPagesController < ApplicationController

  def home
  end

  def about
  end

  def events
    @vow_of_silence_event = Event.where(vow_silence: true).order(:created_at).first
    @ee_challenge_event = Event.where(ee_challenge: true).order(:created_at).first
    @mini_we_day_event = Event.where(we_day: true).order(:created_at).first
  end

  def contact
    @message = ContactFormMessage.new
  end

  def vow_of_silence
    @vow_of_silence_event = Event.where(vow_silence: true).order(:created_at).first
  end

  def ee_dance_challenge
    @ee_challenge_event = Event.where(ee_challenge: true).order(:created_at).first
  end

  def mini_we_day
    @mini_we_day_event = Event.where(we_day: true).order(:created_at).first
  end

end
