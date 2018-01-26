module Admin
  class TasksController < ApplicationController
    layout 'admin'

    before_action :load_task, only: [:show, :edit, :update, :destroy]
    before_action :new_task, only: [:new, :create]
    before_action :load_tasks, only: [:index]

    def index; end
    def show; end
    def new; end
    def edit; end

    def create
      if @task.update(task_params)
        @task.save

        redirect_to admin_tasks_path, notice: "Task created"
      else
        render :new
      end
    end

    def update
      if @task.update(task_params)
        redirect_to admin_task_path(@task), notice: "Task updated"
      else
        render :edit
      end
    end

    def destroy
      @task.delete

      redirect_to admin_tasks_path, notice: "Task deleted"
    end

    private

    def task_params
      params.require(:task).permit(:name, :description)
    end

    def new_task
      @task = Task.new
    end

    def load_task
      @task = Task.find(params[:id])
    end

    def load_tasks
      @tasks = Task.all
    end
  end
end
