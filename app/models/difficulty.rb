class Difficulty < ActiveRecord::Base
    has_many :questions
    has_many :quiz_difficulties
    has_many :quizzes, through: :quiz_difficulties


    
    def sort_difficulty
      self.questions
    end 
    
  end
  
  #method to find what difficulty user chooses
  #make questions all of the same difficulty 
