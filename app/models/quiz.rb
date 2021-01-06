class Quiz < ActiveRecord::Base
  has_many :quiz_difficulties
  has_many :difficulties, through: :quiz_difficulties
  belongs_to :user
  

  def question_pool
    question_p = Question.all.select{|question| question.difficulty.id == self.difficulties.ids.first}
    question_p.sample(2)
  end
  
  def mix_questions
    questions = self.question_pool.sample(2)
    questions
  end 


  
end

#putting a question - choose from question pool 
