class WelcomeController < ApplicationController
  def index
    # puts "attempting to send mail"
  end

  def syllabus
    @hide_nav = true
  end
end