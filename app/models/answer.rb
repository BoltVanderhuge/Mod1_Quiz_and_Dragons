class Answer < ActiveRecord::Base
    has_many :qas 
    has_many :questions, through: :qas 
end