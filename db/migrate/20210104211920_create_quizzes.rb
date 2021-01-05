class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      #t.integer :quiz_difficulty_id, :default => nil 
      t.integer :score, :default => 0
      t.timestamp
    end
  end
end
