class WelcomeController < ApplicationController
  def index
    # puts "attempting to send mail"
  end

  def syllabus
    @hide_nav = true
  end

  def prework
    @hide_nav = true 
    @prework = true
  end
end