class Quiz < ActiveRecord::Base
  has_many :quiz_difficulties
  has_many :difficulties, through: :quiz_difficulties
  belongs_to :user
  
  
  

  def question_pool
    question_p = Question.all.select{|question| question.difficulty.id == self.difficulties.ids.first}
    question_p.sample(5)
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
    # question_texts = self.get_questions_from_pool(question_pools)
    # question_category = self.get_category_from_pool(question_pools)
    # quiz_array.push(question_pools,question_texts,question_category)
    # quiz_array
    quiz_array.push(question_pools)
    quiz_array
    #binding.pry
  end
    
  def getting_an_answer_correct
    self.score += 10
    self.save
  end

  def getting_an_answer_incorrect
    self.score -= 8
    self.save
  end

  def get_current_score
    self.score
  end 
  

end 

#iterate over current quiz info, print the cateogry and the question for each

