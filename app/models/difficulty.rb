class Difficulty < ActiveRecord::Base
    has_many :questions
    belongs_to :quiz_difficulty
  end
  