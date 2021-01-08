class Quiz < ActiveRecord::Base
  has_many :quiz_difficulties
  has_many :difficulties, through: :quiz_difficulties
  belongs_to :user
  
  
  

  def question_pool
    question_p = Question.all.select{|question| question.difficulty.id == self.difficulties.ids.first}
    question_p.sample(10)
  end
  
  def  get_questions_from_pool(array)
    array.map {|question| question.question_text}
  end 

  def get_category_from_pool(array)
    array.map {|question| question.category}
  end

  def current_quiz_info
    quiz_array = []
    question_pools = self.question_pool
    quiz_array.push(question_pools)
    quiz_array
  end
    
  def getting_an_answer_correct
    self.score += 10
    self.save
  end

  def slaying_final_boss
    self.score += 50
    self.save
  end

  def hitting_boss
    self.dragon -= 1
  end

  def boss_health
    self.dragon
  end


  def getting_final_boss_answer_incorrect
    self.health -= 20
    self.score -= 10
    self.save
  end

  def getting_an_answer_incorrect
    self.score -= 8
    self.health -= 10
    self.save
  end

  def get_current_score
    self.score
  end 
  
  def get_current_health
    self.health
  end 

end 


