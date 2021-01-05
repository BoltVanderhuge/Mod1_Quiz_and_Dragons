require 'pry'
class Interface
    attr_reader :prompt
    attr_accessor :user

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
        binding.pry
        puts "Ha ha! I see you are a person of great taste and wit but tell me more of yourself"
        # name = prompt.ask("What is your character name?")
        # while User.find_by(character: name)
        #     puts "I know #{user.character} and you are no #{user.character} "
        #     name = prompt.ask("What is your character name?")
        # end
        # self.user = User.create(character: name)
        # puts "Greetings #{user.character}!"
    end

end

#create unique username
    #
#prompt difficulty 
#start new instance of quizdifficulty 
#start quiz 
