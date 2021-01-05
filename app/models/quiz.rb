class Quiz < ActiveRecord::Base
  has_many :quiz_difficulties
  has_many :difficulties, through: :quiz_difficulties
  belongs_to :user
  

  def question_pool
    Question.all.select{|question| question.difficulty_id == self.difficulties}
    binding.pry
  end
  
  def mix_questions(difficulty)
    questions = self.question_pool(difficulty).sample(2)
    questions
  end 


  
end

#putting a question - choose from question pool - make sure a question is not chose twice in the same instance