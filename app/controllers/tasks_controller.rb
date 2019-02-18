class TasksController < ApplicationController
  before_action :set_message ,only:[:show, :edit, :update ,:destroy]
  
  def index
    @tasks = Task.order(id: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスクが追加されました'
      redirect_to @task
    else
      flash.now[:danger] = "タスクを追加できませんでした"
      render :new
    end
    
  end

  def edit
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = 'タスクが編集されました'
      redirect_to @task
    else
      flash.now[:danger] = "タスクを編集できませんでした"
      render :edit
    end
    
  end

  def destroy
    @task.destroy
    flash[:warning] = 'タスクを削除しました'
    redirect_to tasks_url
  end
  
  private
  
  def set_message
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content,:status)
  end
end
