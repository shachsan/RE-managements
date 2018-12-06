class SessionsController < ApplicationController
  def new
  end

  def create
    agent = Agent.find_by(email: params[:session][:email].downcase)

    if agent && agent.authenticate(params[:session][:password])
      session[:user_id] = agent.id
      flash[:success] = "You have successfully logged in"
      redirect_to agent_path(agent)
    else
      flash.now[:danger] = 'Your login information do not match with our record. Please try again'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end
