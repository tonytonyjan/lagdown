class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def default_url_options
    {host: Settings.host}
  end

  # def test
  #   b = session[:test].to_i
  #   b += 1
  #   session[:test] = b
  # end

end
