class AddHealthColumnToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :health, :integer , :default => 100
  end
end

