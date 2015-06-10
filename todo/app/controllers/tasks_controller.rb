class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @user = User.find(params[:user_id])
    @task = Task.new(task_params, user_id: params[:user_id])
    if @task.save
      redirect_to user_path(@user)
    else
      redirect_to new_user_task_path(@user)
    end
  end

  def destroy
  end

  def task_params
    params.require(:task).permit(:content)
  end
end
