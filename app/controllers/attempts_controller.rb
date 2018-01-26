class AttemptsController < ApplicationController
  before_action :new_attempt, only: [:new, :create]
  before_action :load_attempt, only: :show

  def new; end
  def show; end

  def create
    if @attempt.update(attempt_params)
      @attempt.save

      redirect_to task_path(@task.id), notice: "Attempt created"
    else
      render :new
    end
  end

  private

  def attempt_params
    params.require(:attempt).permit(:code)
  end

  def load_attempt
    @attempt = Attempt.find(params[:id])
  end

  def new_attempt
    @task = Task.find(params[:task_id])
    @attempt = @task.attempts.new
  end
end
