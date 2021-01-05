class User < ActiveRecord::Base
    has_many :quizzes
    has_many :quiz_difficulties, through: :quizzes
end
