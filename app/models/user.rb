class User < ActiveRecord::Base
    has_many :quizzes
    has_many :quiz_difficulties, through: :quizzes

    def change_name(new_name)
        self.character = new_name
        self.save
    end

    def delete_user
        self.destroy # :D
    end


end
