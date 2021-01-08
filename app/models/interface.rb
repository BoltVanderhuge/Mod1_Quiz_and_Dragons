require 'pry'
class Interface
    attr_reader :prompt
    attr_accessor :user, :quiz, :quiz_difficulties, :selection, :fire


    
    def initialize
        @prompt = TTY::Prompt.new
    end

    def start_game 
    system 'clear'
    Fire.go
    system 'clear'
       puts "


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

                                                                                               ░".colorize(:red)
   

        prompt.select("Your fate lies in the hands of 10 questions...".colorize(:light_blue)) do |menu|
            menu.choice "Start Game", -> {welcome}
        end
    end

    def welcome
        system 'clear'
        prompt.select("Welcome mind weary traveler, pull up a chair. I have a story to tell you".colorize(:yellow)) do |menu|
            menu.choice "Tell your story", -> {new_quiz_helper}
            menu.choice "Continue a tale", -> {continue_helper}
            menu.choice "Trouble me no more", -> {exit_helper}
        end
    end


    def new_quiz_helper
        system 'clear'
        puts "Ha ha! I see you are a person of great taste and wit but tell me more of yourself".colorize(:yellow)
        name = prompt.ask("What is your character name?".colorize(:light_blue), required: true)
        while User.find_by(character: name)
            user_name = User.find_by(character: name)
            puts "I know #{user_name.character} and you are no #{user_name.character} ".colorize(:yellow)
            name = prompt.ask("What is your character name?".colorize(:light_blue), required: true)
        end
        pass = prompt.mask("Tell me a secret phrase that only you might know".colorize(:light_blue))
        self.user = User.create(character: name, password: pass)
        system 'clear'
        puts "Greetings #{user.character}!".colorize(:light_blue)
        difficulty_selection
    end

    def continue_helper
        system 'clear'
        puts "You've been this way before, I remember the gleam in your eye".colorize(:yellow)
        name = prompt.ask("Remind me though what is your name".colorize(:light_blue))
        while !User.all.map(&:character).include?(name)
            puts "No that can't be right never heard of them".colorize(:yellow)
            name = prompt.ask("Remind me though what is your name".colorize(:light_blue), required: true)
        end
        pass = prompt.mask("Oh, and give me that secret phrase we established".colorize(:light_blue))
        while !User.where('character = ?', name).map(&:password).include?(pass)
            puts "Hey #{name} I think you have something caught in your throat try again".colorize(:yellow)
            pass = prompt.mask("Oh, and give me that secret phrase we established".colorize(:light_blue))
        end
            self.user = User.all.find_by(character: name)
        system 'clear'
        puts "Welcome back #{name}!".colorize(:green)
        prompt.select("You have returned to the tavern, now will you hear a new tale of excitement or get a pint and do some introspection".colorize(:yellow)) do |menu|
            menu.choice "Hear a new tale of excitement", -> {difficulty_selection}
            menu.choice "Look at your reflection in a pool of ale", -> {user_stat_helper}
        end
    end

    def user_stat_helper
        prompt.select ("Do you not like what you see".colorize(:light_blue)) do |menu|
            menu.choice "Update Character Name", -> {update_character}
            menu.choice "Delete Character", -> {delete_character_selection}
            menu.choice "No, no I look good", -> {user_stat_continue}
        end
    end 

    def user_stat_continue
        system 'clear'
        prompt.select("So what will it be?".colorize(:light_blue)) do |menu|
            menu.choice "Hear a new tale of excitement", -> {difficulty_selection}
            menu.choice "Return your gaze to your reflection in a pool of ale", -> {user_stat_helper}
        end
    end
    
    def update_character
        new_name = prompt.ask("What shall I call you now then?".colorize(:light_blue), required: true)
        while User.find_by(character: new_name)
            user_name = User.find_by(character: new_name)
            puts "Someone already goes by #{new_name}. We can't have two of you running around...".colorize(:yellow)
            new_name = prompt.ask("What shall I call you now then?".colorize(:light_blue), required: true)

        end
        self.user.change_name(new_name)
        puts "That new moniker suites you well #{new_name}!".colorize(:light_blue)
        sleep (1.5)
        system 'clear'
        update_character_continue 
    end 

    def update_character_continue
        prompt.select("You have had a pint, now will you hear a new tale of excitement or have another round".colorize(:light_blue)) do |menu|
            menu.choice "Hear a new tale of excitement", -> {difficulty_selection}
            menu.choice "Gaze again at your reflection in a pool of ale", -> {user_stat_helper}
        end
    end

    def delete_character_selection
        prompt.select ("You wish to strike your name from my tome of travelers?".colorize(:yellow)) do |menu|
            menu.choice "No, no just a slip of the tongue, please draw me a pint", -> {non_delete_continue}
            menu.choice "Yes I tire of the renown", -> {delete_character}
        end
    end

    def non_delete_continue
        prompt.select("A fine choice and a fine draught, here you go".colorize(:light_blue)) do |menu|
            menu.choice "'Why not a story while I enjoy my drink?'", -> {difficulty_selection}
            menu.choice "Gaze again at your reflection your tankard of ale", -> {user_stat_helper}
        end
    end

    def delete_character
        puts "No hard feelings".colorize(:yellow)
        self.user.delete_user
        exit_helper
    end

    def difficulty_selection
        puts "It just so happens my tale of wits,wisdoms and wyverns also involves #{user.character}, a relative perhaps?".colorize(:yellow)
        prompt.select ("Tell me would you like a tale of hardships or of ease or something heroically inbetween?".colorize(:light_blue)) do |menu|
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

    def reduce_answer(answer)
        answer = answer.downcase
        answer = answer.gsub('the ', '')
        answer = answer.gsub('a ', '')
        answer = answer.gsub('an ', '')
        answer = answer.gsub('and ', '')
        answer = answer.gsub(':', '')
        answer = answer.gsub('"', '')
        answer = answer.gsub(' ', '')
        answer = answer.gsub('.', '')
    end

    def playing_the_game
        quiz_question_array = self.quiz.current_quiz_info[0]
        system 'clear'
        puts 
        quiz_question_array.each do |question|
            puts "#{villians.sample}"
            puts "The Category is: ".colorize(:light_blue)
            puts "#{question.category}".colorize(:yellow)
            puts "#{question.question_text}"
            choices = %w()
            question.answers.each do |answer|
            choices.push(answer.answer_text => answer)
            end
            self.selection = prompt.select("Choose the correct answer".colorize(:light_blue), choices.shuffle) do |menu|
        end
            if self.selection.is_it_correct
                self.quiz.getting_an_answer_correct
                puts "Well done your current score is #{self.quiz.get_current_score}".colorize(:green) 
            else 
                self.quiz.getting_an_answer_incorrect
                puts "Oh you poor fool your current score is #{self.quiz.get_current_score} better keep an eye on your health it is now #{self.quiz.get_current_health} ♥ ".colorize(:red) 
                sleep (2)
            end
        end 
        sleep (1.5)
        system 'clear'
        puts "You've made it this far, time for the toughest bout yet, but be careful your health is only #{self.quiz.get_current_health}" ♥.colorize(:yellow)
        sleep (4)
        system 'clear'
        puts "There's something large behind you that is shaking the ground beneath your boots...".colorize(:cyan)
        sleep (3)
        puts "🐲The mighty Quizzing Dragon roars and blasts you with it's opening salvo!🐉".colorize(:light_red)
        sleep (2)
        final_boss
    end

    def final_boss

        jep_class = Jep.new
        qa_array = jep_class.question_and_answer_hash
        if quiz.get_current_health > 0
            puts "The Category is: ".colorize(:light_blue) 
            puts "#{qa_array[0]}".colorize(:yellow) 
            puts "#{qa_array[1]}"
            answer = prompt.ask("What is your answer?".colorize(:light_blue), required: true).downcase
            if reduce_answer(answer) == reduce_answer(qa_array[2]) && self.quiz.boss_health > 0
                system 'clear'
                puts "You stab at the mighty beast injuring it severely".colorize(:magenta)
                self.quiz.hitting_boss
                if self.quiz.boss_health == 0
                    self.quiz.slaying_final_boss
                    puts "You have felled the mighty quiz dragon".colorize(:light_blue)
                    won_game
                else
                    final_boss
                end
            elsif answer != qa_array[2] && self.quiz.boss_health > 0
                self.quiz.getting_final_boss_answer_incorrect
                if self.quiz.health >= 20 
                    puts "Wrong the answer was #{qa_array[2]}"
                    puts "Now the dragon takes a bite out of you, oh the pain! Your health is now #{self.quiz.get_current_health}".colorize(:red) 
                    final_boss
                else
                    puts "The beast has bested you, you have learned a valuble lesson. Never match wits with a dragon...".colorize(:yellow)
                    game_over
                end
            end 
        end
    end

    def game_over
        prompt.select ("Will this be how you are remembered? As a dragon's snack?".colorize(:light_blue)) do |menu|
            menu.choice "I will have that dragon's head!", -> {user_stat_continue}
            menu.choice "I tire of this tale, this tavern and of you", -> {exit_helper}
        end
    end 

    def exit_helper
        puts "Until our paths cross again...".colorize(:yellow)
        system 'exit'
    end

    def won_game
        puts "🎈Congratulations, you succeeded! This legend will be told to everyone in the village🎇".colorize(:green)
        system 'exit'
    end 

    def villians
        villians = ["🧙‍♂️ A wizard appears and starts chanting pointedly at you 🧙‍♂️","🦴 A skeleton clicks and clacks and attacks 🦴","🔪 A thief comes up behind you knife to your throat 🔪","🏇 A knight-errant appears forsworn and angry 🏇","🧛‍♂️ That was no oridnary bat! A dracula appears and he's out for bluhhhhd 🧛‍♂️","🧟‍♂️ A zombie stumbles it's way towards you, it must've been drawn to your prodigious brain 🧟‍♂️","👨‍🚀 An astronaut has descended from the astral plain to put you in some astral pain 👨‍🚀","👨‍🍳 A cannibal chef has been waiting for the right time to try their recipe for big brain stew 👨‍🍳","👩‍🔬 A mad scientist appears in a puff of green smoke looking for a brain to put in their Trivia-Bot 9000 and they look like they won't ask nicely 👩‍🔬","🧙‍♀️ A sorcerer starts meancing you with their staff 🧙‍♀️","🧚‍♀️ The toothfairy appears and it looks like she wants way more than teeth from you 🧚‍♀️","🤹‍♂️ A juggler has escaped from the Psycho Circus it looks like they want to add your head to their current routine 🤹‍♂️"
    ]
    end

end