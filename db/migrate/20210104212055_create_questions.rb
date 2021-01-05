class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :category
      t.integer :difficulty_id
      t.timestamp
    end
  end
end
