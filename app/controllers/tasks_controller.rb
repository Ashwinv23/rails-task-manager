class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # uses GET request
  def new
    @task = Task.new # just inialiaze task and get to the form page
  end

  # uses POST request
  def create
    @task = Task.new(task_params) # create an object with strong params
    @task.save
    redirect_to tasks_path # redirect to tasks page after clicking 'create task'
  end

  private

  # strong params - needed for security purpose so it doesn't take crap inputs
  def task_params
    params.require(:task).permit(:title, :details) # permit only what is given
  end
end
