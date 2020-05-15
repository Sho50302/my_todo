class TasksController < ApplicationController
  before_action :set_group, except: [:index, :user_new, :user_create, :user_edit, :user_update, :user_show, :user_destroy]

  def index
    @tasks = Task.includes(:user)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to group_path(@group)
  end

  def show
    @task = @group.tasks.find(params[:id])
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to group_path(@group)
  end

  def user_new
    @task = Task.new
  end

  def user_create
    @task = Task.new(user_task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def user_edit
    @task = Task.find(params[:id])
  end

  def user_update
    task = Task.find(params[:id])
    task.update(user_task_params)
    redirect_to root_path
  end

  def user_show
    @task = Task.find(params[:id])
  end

  def user_destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :start_date, :start_time_hour, :start_time_minute, :end_date, :end_time_hour, :end_time_minute).merge(user_id: current_user.id, group_id: @group.id)
  end

  def user_task_params
    params.require(:task).permit(:title, :content, :start_date, :start_time_hour, :start_time_minute, :end_date, :end_time_hour, :end_time_minute).merge(user_id: current_user.id)
  end


  def set_group
    @group = Group.find(params[:group_id])
  end
  
end
