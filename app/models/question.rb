class Question < ActiveRecord::Base
    has_many :qas
    has_many :answers, through: :qas
    belongs_to :difficulties
  end
  