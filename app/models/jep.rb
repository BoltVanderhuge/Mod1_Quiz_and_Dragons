require 'net/http'
require 'json'
require 'pry'
class Jep
    attr_accessor :questions, :response, :uri  
# @uri = URI('https://jservice.io/api/random') #'https://jservice.io/api/random?count=5'
# @response = Net::HTTP.get(@uri)
# @questions = JSON.parse(@response)


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
        answer = Sanitize.fragment(question["answer"].downcase)
        if question_text.empty? || answer.empty?
            puts "A wizard has caused some mischief soon the query will appear"
        else
            array = [category, question_text, answer]
            break
        end
    end
    array
# downcase.gsub(/[^\w\s]/, ''))
    # <\/?[bi]>
    #gsub(/[^a-z0-9\s]/i, '') (/[^a-zA-Z\s\d]/, '') (/[^\w\s]/, '') (/[!@#$%^&*()-=_+|;':",.<>?']/, '')
end

end

#To do list: 
    #response/questions
    #typing in answer = correct
    #health 