class Difficulty < ActiveRecord::Base
    has_many :questions
    has_many :quiz_difficulties
    has_many :quizzes, through: :quiz_difficulties


    
    
  end
  

