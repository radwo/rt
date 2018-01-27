class AttemptCreator
  def initialize(attributes)
    @attributes = attributes
  end

  def call
    if attempt.update(attributes)
      test_this_attempt

      [true, attempt]
    else
      [false, attempt]
    end
  end

  private
  attr_reader :attributes

  def attempt
    @attempt ||= Attempt.new
  end


  def test_this_attempt
    attempt.task.solutions.each { |solution|
      result = attempt.results.create(expected: solution.output)
      program = CodeBuilder.new.(attempt.code, solution.input, attempt.task.template)
      RunnerWorker.perform_async(result.id, program)
    }
  end
end
