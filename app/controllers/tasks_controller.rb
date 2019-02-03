class TasksController < ApplicationController
  before_action :set_message ,only:[:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
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
      flash.now[:danger] = "エラーが発生しました"
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
      flash.now[:danger] = "エラーが発生しました"
      render :edit
    end
    
  end

  def destroy
    @task.destroy
    flash[:success] = 'タスクを完了しました'
    redirect_to tasks_url
  end
  
  private
  
  def set_message
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content)
  end
end
