class TasksController < ApplicationController
  before_action :load_task, only: [:show]
  before_action :load_tasks, only: [:index]

  def index; end
  def show; end

  private

  def load_tasks
    @tasks = Task.all
  end

  def load_task
    @task = Task.find(params[:id])
  end
end
