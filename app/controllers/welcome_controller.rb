class WelcomeController < ApplicationController
  def index
    # puts "attempting to send mail"
  end

  def syllabus
    render layout: "short_form"
  end
end