class TasksController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end

  def create
    @user = User.find(params[:user_id])
    @task = Task.new(task_params, user_id: @user.id)
    @task.user = @user
    if @task.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
  end

  def task_params
    params.require(:task).permit(:content)
  end
end
