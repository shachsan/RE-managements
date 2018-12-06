class ApplicationController < ActionController::Base
  helper_method :current_agent, :logged_in?
  before_action :setup_agent_stuff

  private

  def current_agent
    @current_agent ||= Agent.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_agent
  end

  def setup_agent_stuff
    if session["user_id"]
      @logged_in_agent = Agent.find(session["user_id"])
      setup_agent_arrays
    end
  end

  def setup_agent_arrays
    @agent_apartments = @logged_in_agent.apartments
    @agent_buildings = @logged_in_agent.buildings
  end

  def logged_on?
    !!session[:user_id]
  end

  def require_agent
    if !logged_in?
      flash[:danger] = "You must be logged to perform this"
      redirect_to root_path
    end
  end

  def authenticate
    redirect_to new_session_path unless logged_in?
  end

end
