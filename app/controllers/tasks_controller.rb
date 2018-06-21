class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
  end
  
  def create
    @task = Task.new(task_params) 

    if @task.save
      redirect_to @task, notice: 'Task created!'
    else
      flash.now[:error] = @task.errors.full_messages.to_sentence
      render :new
    end

  end

  def update
    
    if @task.update(task_params)
      redirect_to @task, notive: 'Task Updated!'
    else
      flash.now[:error] = @task.errors.full_messages.to_sentence
      render :edit
    end

  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was deleted!'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.requitre(:task).permit(:name, :details, :due_date, :category_id) 
  end

end
