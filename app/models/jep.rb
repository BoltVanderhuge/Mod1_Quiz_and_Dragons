require 'net/http'
require 'json'
require 'pry'
class Jep
    attr_accessor :questions, :response, :uri  

    def get_question
        uri = URI('https://jservice.io/api/random') 
        response = Net::HTTP.get(uri)
        JSON.parse(response).first
    end

    def question_and_answer_hash
        while 
            question = self.get_question
            category = question["category"]["title"].titleize
            question_text = question["question"]
            answer = Sanitize.fragment(question["answer"])
            if question_text.empty? || answer.empty? || category.empty?
                puts "A wizard has caused some mischief soon the query will appear".colorize(:yellow)
            else
                array = [category, question_text, answer]
                break
                binding.pry
            end
        end
        array
    end
end