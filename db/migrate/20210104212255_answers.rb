class Answers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer_text
      t.timestamp
    end
  end
end
