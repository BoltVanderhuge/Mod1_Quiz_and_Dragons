class QuizDifficulty < ActiveRecord::Base
  belongs_to :quiz
  # has_many :quizzes 
  # has_many :difficulties 
  belongs_to :difficulty

  

end
