class QuizDifficulty < ActiveRecord::Base
  has_many :quizzes
  has_many :difficulties
end
