require 'net/http'
require 'json'
require 'pry'
class Jep
    attr_accessor :questions, :response, :uri  
# @uri = URI('https://jservice.io/api/random') #'https://jservice.io/api/random?count=5'
# @response = Net::HTTP.get(@uri)
# @questions = JSON.parse(@response)



def question_and_answer_hash
    uri = URI('https://jservice.io/api/random') 
    response = Net::HTTP.get(uri)
    questions = JSON.parse(response)

    array = []
    array.push(questions[0]["category"]["title"].titleize)
    array.push(questions[0]["question"])
    array.push(questions[0]["answer"].downcase.gsub(/[^\w\s]/, ''))
    array
    # <\/?[bi]>
    #binding.pry
    #gsub(/[^a-z0-9\s]/i, '') (/[^a-zA-Z\s\d]/, '') (/[^\w\s]/, '') (/[!@#$%^&*()-=_+|;':",.<>?']/, '')
end

end

#To do list: 
    #response/questions
    #typing in answer = correct
    #health 