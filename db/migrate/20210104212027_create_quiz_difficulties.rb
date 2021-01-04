class CreateQuizDifficulties < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_difficulties do |t|
      t.integer :quiz_id
      t.integer :difficulty_id
      t.timestamp
    end
  end
end
