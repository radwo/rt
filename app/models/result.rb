class Result < ApplicationRecord
  belongs_to :attempt, inverse_of: :results

  def succes?
    done && expected == output
  end

  def failure?
    done == false || (done && expected != output)
  end

  def running?
    done.nil?
  end
end
