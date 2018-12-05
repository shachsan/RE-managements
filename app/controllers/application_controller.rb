class ApplicationController < ActionController::Base
  helper_method :current_agent, :logged_in?

  def current_agent
    @current_agent ||= Agent.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_agent
  end

  def require_agent
    if !logged_in?
      flash[:danger] = "You must be logged to perform this"
      redirect_to root_path
    end
  end

end
