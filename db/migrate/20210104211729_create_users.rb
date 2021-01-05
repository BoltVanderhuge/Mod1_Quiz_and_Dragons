class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :character
      t.string :password, :default => "123"
      t.timestamp
    end 
  end
end
