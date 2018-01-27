class RunnerWorker
  include Sidekiq::Worker

  def perform(result_id, program)
    runner = runner_class.new(program)
    runner.run
    loop do
      runner.abort_if_too_long
      break if runner.finished?

      sleep 1
    end

    Result.where(id: result_id).update_all(
      output: runner.result,
      done: runner.succesed?
    )
  end

  private

  def runner_class
    ::Runner
  end
end
