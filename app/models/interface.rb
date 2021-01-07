require 'pry'
class Interface
    attr_reader :prompt
    attr_accessor :user, :quiz, :quiz_difficulties, :selection


    
    def initialize
        @prompt = TTY::Prompt.new
    end

    def start_game #image is a place holder
    system 'clear'
       puts"


▄▄▄█████▓ ██▀███   ██▓ ▄▄▄       ██▓      ██████     ▒█████    █████▒   ▄▄▄█████▓ ██▀███   ██▓ ██▒   █▓ ██▓ ▄▄▄      
▓  ██▒ ▓▒▓██ ▒ ██▒▓██▒▒████▄    ▓██▒    ▒██    ▒    ▒██▒  ██▒▓██   ▒    ▓  ██▒ ▓▒▓██ ▒ ██▒▓██▒▓██░   █▒▓██▒▒████▄    
▒ ▓██░ ▒░▓██ ░▄█ ▒▒██▒▒██  ▀█▄  ▒██░    ░ ▓██▄      ▒██░  ██▒▒████ ░    ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██▒ ▓██  █▒░▒██▒▒██  ▀█▄  
░ ▓██▓ ░ ▒██▀▀█▄  ░██░░██▄▄▄▄██ ▒██░      ▒   ██▒   ▒██   ██░░▓█▒  ░    ░ ▓██▓ ░ ▒██▀▀█▄  ░██░  ▒██ █░░░██░░██▄▄▄▄██ 
  ▒██▒ ░ ░██▓ ▒██▒░██░ ▓█   ▓██▒░██████▒▒██████▒▒   ░ ████▓▒░░▒█░         ▒██▒ ░ ░██▓ ▒██▒░██░   ▒▀█░  ░██░ ▓█   ▓██▒
  ▒ ░░   ░ ▒▓ ░▒▓░░▓   ▒▒   ▓▒█░░ ▒░▓  ░▒ ▒▓▒ ▒ ░   ░ ▒░▒░▒░  ▒ ░         ▒ ░░   ░ ▒▓ ░▒▓░░▓     ░ ▐░  ░▓   ▒▒   ▓▒█░
    ░      ░▒ ░ ▒░ ▒ ░  ▒   ▒▒ ░░ ░ ▒  ░░ ░▒  ░ ░     ░ ▒ ▒░  ░             ░      ░▒ ░ ▒░ ▒ ░   ░ ░░   ▒ ░  ▒   ▒▒ ░
  ░        ░░   ░  ▒ ░  ░   ▒     ░ ░   ░  ░  ░     ░ ░ ░ ▒   ░ ░         ░        ░░   ░  ▒ ░     ░░   ▒ ░  ░   ▒   
            ░      ░        ░  ░    ░  ░      ░         ░ ░                         ░      ░        ░   ░        ░  ░
                                                                                                   ░                 

                                                                                               ░                 
                                        ==(W{==========-      /===-                        
                                            ||  (.--.)         /===-_---~~~~~~~~~------____  
                                            | \_,|**|,__      |===-~___                _,-' `
                                -==\\        `\ ` `--`   ),    `//~\\   ~~~~`---.___.-~~      
                            ______-==|        /`\_. .__/\ \    | |  \\           _-~`         
                    __--~~~  ,-/-==\\      (   | .  |~~~~|   | |   `\        ,`             
                    _-~       /`    |  \\     )__/==0==-\<>/   / /      \      /               
                .`        /       |   \\      /~\___/~~\/  /` /        \   /`                
                /  ____  /         |    \`\.__/-~~   \  |_/`  /          \/`                  
                /-`~    ~~~~~---__  |     ~-/~         ( )   /`        _--~`                   
                                \_|      /        _) | ;  ),   __--~~                        
                                    `~~--_/      _-~/- |/ \   `-~ \                            
                                {\__--_/}    / \\_>-|)<__\      \                           
                                /`   (_/  _-~  | |__>--<__|      |                          
                                |   _/) )-~     | |__>--<__|      |                          
                                / /~ ,_/       / /__>---<__/      |                          
                                o-o _//        /-~_>---<__-~      /                           
                                (^(~          /~_>---<__-      _-~                            
                                ,/|           /__>--<__/     _-~                               
                            ,//(`(          |__>--<__|     /    .----_          
                            ( ( `))          |__>--<__|    |                 /` _---_~\        
                        `-)) )) (           |__>--<__|    |               /`  /     ~\`\      
                        ,/,`//( (             \__>--<__\    \            /`  //        ||      
                    ,( ( ((, ))              ~-__>--<_~-_  ~--____---~` _/`/        /`       
                    `~/  )` ) ,/|                 ~-_~>--<_/-__       __-~ _/                  
                ._-~//( )/ )) `                    ~~-`_/_/ /~~~~~~~__--~                    
                ;`( `)/ ,)(                              ~~~~~~~~~~                         
                ` `) `( (/                                                                   
                    `   `  `"

  prompt.select("Your fate lies in the hands of 20 questions...") do |menu|
   menu.choice "Start Game", -> {welcome}
  end
end

    def welcome
        system 'clear'
        prompt.select("Welcome mind weary traveler, pull up a chair. I have a story to tell you") do |menu|
            menu.choice "Tell your story", -> {new_quiz_helper}
            menu.choice "Continue a tale", -> {continue_helper}
            menu.choice "Trouble me no more", -> { exit_helper}
        end
    end


    def new_quiz_helper
        system 'clear'
        puts "Ha ha! I see you are a person of great taste and wit but tell me more of yourself"
        name = prompt.ask("What is your character name?")
        while User.find_by(character: name)
            user_name = User.find_by(character: name)
            puts "I know #{user_name.character} and you are no #{user_name.character} "
            name = prompt.ask("What is your character name?")
        end
        pass = prompt.ask("Tell me a secret phrase that only you might know")
        self.user = User.create(character: name, password: pass)
        puts "Greetings #{user.character}!"
        difficulty_selection
    end

    def continue_helper
        system 'clear'
        puts "You've been this way before, I remember the gleam in your eye"
        name = prompt.ask("Remind me though what is your name")
        while !User.all.map(&:character).include?(name)
            puts "No that can't be right never heard of them"
            name = prompt.ask("Remind me though what is your name")
        end
        pass = prompt.ask("Oh, and give me that secret phrase we established")
         while !User.where('character = ?', name).map(&:password).include?(pass)
            puts "Hey #{name} I think you have something caught in your throat try again"
            pass = prompt.ask("Oh, and give me that secret phrase we established")
        end
            self.user = User.all.find_by(character: name)
            #binding.pry
        puts "Welcome back #{name}!"
        prompt.select("You have returned to the tavern, now will you hear a new tale of excitement or get a pint and do some introspection") do |menu|
            menu.choice "Hear a new tale of excitement", -> {difficulty_selection}
            menu.choice "Look at your reflection in a pool of ale", -> {user_stat_helper}
        end
    end

    def user_stat_helper
        prompt.select ("Do you not like what you see") do |menu|
            menu.choice "Update Character Name", -> {update_character}
            menu.choice "Delete Character", -> {delete_character_selection}
            # menu.choice "View Character Score", -> {}
            menu.choice "No, no I look good", -> {user_stat_continue}
        end
    end 

    def user_stat_continue
        prompt.select("So what will it be?") do |menu|
            menu.choice "Hear a new tale of excitment", -> {difficulty_selection}
            menu.choice "Gaze again at your reflection in a pool of ale", -> {user_stat_helper}
        end
    end
    
    def update_character
        new_name = prompt.ask("What shall I call you now then?")
        #binding.pry
        while User.find_by(character: new_name)
            user_name = User.find_by(character: new_name)
            puts "Someone already goes by #{new_name}. We can't have two of you running around..."
            new_name = prompt.ask("What shall I call you now then?")
        end
        #binding.pry
        self.user.change_name(new_name)
        puts "That new moniker suites you well #{new_name}!"
        system 'clear'
        update_character_continue 
    end 

    def update_character_continue
        prompt.select("You have had a pint, now will you hear a new tale of excitment or have another round") do |menu|
            menu.choice "Hear a new tale of excitment", -> {difficulty_selection}
            menu.choice "Gaze again at your reflection in a pool of ale", -> {user_stat_helper}
        end
    end

    def delete_character_selection
        prompt.select ("You wish to strike your name from my tome of travelers?") do |menu|
            menu.choice "No, no just a slip of the tounge, please draw me a pint", -> {non_delete_continue}
            menu.choice "Yes I tire of the renown", -> {delete_character}
        end
    end

    def non_delete_continue
        prompt.select("A fine choice and a fine draught, here you go") do |menu|
            menu.choice "'Why not a story while I enjoy my drink?'", -> {difficulty_selection}
            menu.choice "Gaze again at your reflection your tankard of ale", -> {user_stat_helper}
        end
    end

    def delete_character
        puts "No hard feelings"
        self.user.delete_user
        exit_helper
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
        self.quiz = Quiz.create(user_id: user.id)
        self.quiz_difficulties = QuizDifficulty.create(quiz_id: quiz.id, difficulty_id: Difficulty.all[0].id)
        playing_the_game
    end

    def medium_quiz_maker_helper
        self.quiz = Quiz.create(user_id: user.id)
        self.quiz_difficulties = QuizDifficulty.create(quiz_id: quiz.id, difficulty_id: Difficulty.all[1].id)
        playing_the_game
    end
    
    def hard_quiz_maker_helper
        self.quiz = Quiz.create(user_id: user.id)
        self.quiz_difficulties = QuizDifficulty.create(quiz_id: quiz.id, difficulty_id: Difficulty.all[2].id)
        playing_the_game
    end

    def playing_the_game
        quiz_question_array = self.quiz.current_quiz_info[0]
        system 'clear'
        puts 
        quiz_question_array.each do |question|
            puts "The Category is: " "#{question.category}"
            puts "#{question.question_text}"
                choices = %w()
                question.answers.each do |answer|
                choices.push(answer.answer_text => answer)
                end
            self.selection = prompt.select("Choose the correct answer", choices.shuffle) do |menu|
            end
            #binding.pry 
            if self.selection.is_it_correct
                self.quiz.getting_an_answer_correct
                puts "Well done your current score is #{self.quiz.get_current_score} " #is colorize 
            else 
                self.quiz.getting_an_answer_incorrect
                puts "Oh you poor fool your current score is #{self.quiz.get_current_score} " #your current score is and your health is possible warning message for health colorize
            end
        #binding.pry 
        end 
        puts "This is where your story ends"
    end

    def exit_helper
        puts "Until our paths cross again"
        system 'exit'
    end
end