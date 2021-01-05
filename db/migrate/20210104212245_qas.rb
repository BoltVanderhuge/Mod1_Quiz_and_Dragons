class Qas < ActiveRecord::Migration[5.2]
  def change
    create_table :qas do |t|
      t.integer :question_id
      t.integer :answer_id
      t.boolean :correct
      t.timestamp
    end
  end
end
