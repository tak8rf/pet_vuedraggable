class TasksController < ApplicationController
  def index
    @tasks = Task.today_tasks
    @calendars = Task.all
  end
  
  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    Task.create(task_parameter)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice:"削除しました"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_parameter)
      redirect_to tasks_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def task_parameter
    params.require(:task).permit(:title, :content, :start_time)
  end
end
