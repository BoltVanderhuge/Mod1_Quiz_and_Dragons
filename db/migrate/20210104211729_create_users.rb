class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :character
      t.string :password
      t.timestamp
    end 
  end
end
