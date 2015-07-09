class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def base_url
    Rails.env.development? ? "http://" + request.host_with_port : "http://railsclass.com"
  end
end
