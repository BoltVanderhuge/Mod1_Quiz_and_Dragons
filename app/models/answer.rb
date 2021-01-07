class Answer < ActiveRecord::Base
    has_many :qas 
    has_many :questions, through: :qas 

    def is_it_correct
        get_qa = self.qas[0]
        get_qa.correct == true
    end