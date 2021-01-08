class QuizDifficulty < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :difficulty

  def hello
    "Hello"
  end

end
