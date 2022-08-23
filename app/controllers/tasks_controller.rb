
class TasksController < ApplicationController
  before_action :set_pets, only: [:new, :create, :edit, :update]
  
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
    @task=Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "作成しました"
    else
      render 'new'
    end
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
    if @task.update(task_params)
      redirect_to tasks_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def done
    @task = Task.find(params[:id])
    if @task.update(is_done: true )
      ContactMailer.send_when_done(current_user,@task).deliver
      redirect_to tasks_path
    else 
      render 'index'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :start_time, :is_done, :pet_id, :family_id)
  end

  def set_pets
    @pets = current_family.pets
  end
end
