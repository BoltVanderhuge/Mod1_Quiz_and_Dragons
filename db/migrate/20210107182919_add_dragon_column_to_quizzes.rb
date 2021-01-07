class AddDragonColumnToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :dragon, :integer , :default => 3
  end
end
