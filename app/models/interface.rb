require 'pry'
class Interface
    attr_reader :prompt
    attr_accessor :user, :quiz, :quiz_difficulties

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        prompt.select("Welcome mind weary traveler, pull up a chair. I have a story to tell you") do |menu|
            menu.choice "Tell your story", -> {new_quiz_helper}
            menu.choice "Continue a tale", -> {continue_helper}
            menu.choice "Look at your reflection in a pool of ale", -> {user_stat_helper}
            menu.choice "Trouble me no more", -> { exit_helper}
        end
    end

    def new_quiz_helper
        #binding.pry
        puts "Ha ha! I see you are a person of great taste and wit but tell me more of yourself"
        name = prompt.ask("What is your character name?")
        while User.find_by(character: name)
         user_name = User.find_by(character: name)
            puts "I know #{user_name.character} and you are no #{user_name.character} "
            name = prompt.ask("What is your character name?")
        end
        self.user = User.create(character: name)
        puts "Greetings #{user.character}!"
        difficulty_selection
    end

    def difficulty_selection
        puts "It just so happens my tale of wits,wisdoms and wyverns also involves #{user.character}, a relative perhaps?"
        prompt.select ("Tell me would you like a tale of hardships or of ease or something heroically inbetween?") do |menu|
            menu.choice "Easy", -> {easy_quiz_maker_helper}
            menu.choice "Medium", -> {medium_quiz_maker_helper}
            menu.choice "Hard", -> {hard_quiz_maker_helper}
        end
    end

    def easy_quiz_maker_helper
        current_quiz = Quiz.create(user_id: user.id)
        current_difficulty = QuizDifficulty.create(quiz_id: current_quiz.id, difficulty_id: Difficulty.all[0].id)
        current_quiz.question_pool
        "oof"
    end

    def medium_quiz_maker_helper
        current_quiz = Quiz.create(user_id: user.id)
        current_difficulty = QuizDifficulty.create(quiz_id: current_quiz.id, difficulty_id: Difficulty.all[1].id)
        current_quiz.question_pool
        "woof"
    end
    
    def hard_quiz_maker_helper
        current_quiz = Quiz.create(user_id: user.id)
        current_difficulty = QuizDifficulty.create(quiz_id: current_quiz.id, difficulty_id: Difficulty.all[2].id)
        current_quiz.question_pool
        "doof"
    end


end

#create unique username
    #
#prompt difficulty 
#start new instance of quizdifficulty 
#start quiz 
