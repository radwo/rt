class AttemptsController < ApplicationController
  before_action :load_task, only: [:new, :create]
  before_action :new_attempt, only: [:new]
  before_action :load_attempt, only: :show

  def new; end
  def show; end

  def create
    success, @attempt = ::AttemptCreator.new(attempt_params).call

    if success
      redirect_to task_attempt_path(@task.id, @attempt.id), notice: "Attempt created"
    else
      render :new
    end
  end

  private

  def attempt_params
    params.require(:attempt).permit(:code).merge(task_id: params[:task_id])
  end

  def load_attempt
    @attempt = Attempt.find(params[:id])
  end

  def load_task
    @task = Task.find(params[:task_id])
  end

  def new_attempt
    @attempt = @task.attempts.new
  end
end
