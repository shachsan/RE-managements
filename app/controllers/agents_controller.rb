class AgentsController < ApplicationController
  before_action :find_agent, only: [:show, :update, :edit, :destroy]

  def new
    @agent = Agent.new
  end

  def show
  end

  def update
  end

  def create
    @agent = Agent.new(agent_params)
    @agent.email = @agent.email.downcase
    if @agent.save
      flash[:success]= "#{@agent.name}, welcome to RE-management!"
      session[:user_id] = @agent.id
      redirect_to @agent
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  private
  def agent_params
    params.require(:agent).permit(:name, :email, :password)
  end

  def find_agent
    @agent = Agent.find(current_agent.id)
  end
end
