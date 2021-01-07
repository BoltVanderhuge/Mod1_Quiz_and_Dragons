require 'net/http'
require 'json'

uri = URI('https://jservice.io/api/random?count=5')
response = Net::HTTP.get(uri)
questions = JSON.parse(response)