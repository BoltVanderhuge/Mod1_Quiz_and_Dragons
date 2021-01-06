require 'pry'
require 'csv'
# require_relative './questions.csv'

User.destroy_all
Quiz.destroy_all
Difficulty.destroy_all
QuizDifficulty.destroy_all
Question.destroy_all
Answer.destroy_all
Qa.destroy_all
User.reset_pk_sequence
Quiz.reset_pk_sequence
Difficulty.reset_pk_sequence
QuizDifficulty.reset_pk_sequence
Question.reset_pk_sequence
Answer.reset_pk_sequence
Qa.reset_pk_sequence

########### different ways to write your seeds ############
questions = File.read("lib/seeds/questions1.csv")
csv = CSV.parse(questions, :encoding => 'ISO-8859-1')
# questions = CSV.read("db/questions.csv") #change line 40 to questions

SLEEP_TIME = 0   # temp fix for problem with sqlite/development.db access on wsl

jon = User.create(character: "Knight", password: "password")
john = User.create(character: "Ninja", password: "80085")
bill = User.create(character: "Wizard", password: "8675309")

q1 = Quiz.create(user_id: jon.id)
q2 = Quiz.create(user_id: john.id)
q3 = Quiz.create(user_id: bill.id)

easy = Difficulty.create(name: "Easy")
normal = Difficulty.create(name: "Normal")
hard = Difficulty.create(name: "Hard")

easyq1 = QuizDifficulty.create(quiz_id: q1.id, difficulty_id: easy.id)
normalq2 = QuizDifficulty.create(quiz_id: q2.id, difficulty_id: normal.id)
hardq3 = QuizDifficulty.create(quiz_id: q3.id, difficulty_id: hard.id)
csv.each do |q|
    category_name = q[0]
    question_t = q[1]
    correct_answer = q[2]
    incorrect_answer1 = q[3]
    incorrect_answer2 = q[4]
    incorrect_answer3 = q[5]

    t = Question.create(question_text: question_t, difficulty_id: hard.id, category: category_name)
    sleep(SLEEP_TIME)

    a = Answer.create(answer_text: correct_answer)
    sleep(SLEEP_TIME)
    b = Answer.create(answer_text: incorrect_answer1)
    sleep(SLEEP_TIME)
    c = Answer.create(answer_text: incorrect_answer2)
    sleep(SLEEP_TIME)
    d = Answer.create(answer_text: incorrect_answer3)
    sleep(SLEEP_TIME)
    
    qa1 = Qa.create(question_id: t.id, answer_id: a.id, correct: true)
    sleep(SLEEP_TIME)
    qa2 = Qa.create(question_id: t.id, answer_id: b.id, correct: false)
    sleep(SLEEP_TIME)
    qa3 = Qa.create(question_id: t.id, answer_id: c.id, correct: false)
    sleep(SLEEP_TIME)
    qa4 = Qa.create(question_id: t.id, answer_id: d.id, correct: false)
    sleep(SLEEP_TIME)

end



# 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)
# jon = User.create(character: "Knight", password: "password")
# john = User.create(character: "Ninja", password: "80085")
# bill = User.create(character: "Wizard", password: "8675309")

# q1 = Quiz.create(user_id: jon.id)
# q2 = Quiz.create(user_id: john.id)
# q3 = Quiz.create(user_id: bill.id)

# easy = Difficulty.create(name: "Easy")
# normal = Difficulty.create(name: "Normal")
# hard = Difficulty.create(name: "Hard")

# easyq1 = QuizDifficulty.create(quiz_id: q1.id, difficulty_id: easy.id)
# normalq2 = QuizDifficulty.create(quiz_id: q2.id, difficulty_id: normal.id)
# hardq3 = QuizDifficulty.create(quiz_id: q3.id, difficulty_id: hard.id)

question1 = Question.create(question_text: "What sound does a cat make?", difficulty_id: easy.id)
question2 = Question.create(question_text: "This is an easy question?", difficulty_id: easy.id)
question3 = Question.create(question_text: "what color is the sky?", difficulty_id: easy.id)

question4 = Question.create(question_text: "How many wheels does a car have?", difficulty_id: normal.id)
question5 = Question.create(question_text: "How many wheels does a skateboard have?", difficulty_id: normal.id)
question6 = Question.create(question_text: "Where is Germany located?", difficulty_id: normal.id)


correctanswer1 = Answer.create(answer_text: "meow")
incorrectanswer1 = Answer.create(answer_text: "woof")
incorrectanswer1b = Answer.create(answer_text: "moo")
incorrectanswer1c = Answer.create(answer_text: "caw caw")


correctanswer2 = Answer.create(answer_text: "100 percent")
incorrectanswer2 = Answer.create(answer_text: "no")
incorrectanswer2b = Answer.create(answer_text: "negative")
incorrectanswer2c = Answer.create(answer_text: "not remoteley")

correctanswer3 = Answer.create(answer_text: "blue")
incorrectanswer3 = Answer.create(answer_text: "wine colored")
incorrectanswer3b = Answer.create(answer_text: "aubergine")
incorrectanswer3c = Answer.create(answer_text: "puke")

correctanswer4 = Answer.create(answer_text: "4")
incorrectanswer4 = Answer.create(answer_text: "6")
incorrectanswer4b = Answer.create(answer_text: "8")
incorrectanswer4c = Answer.create(answer_text: "12")


correctanswer5 = Answer.create(answer_text: "4")
incorrectanswer5 = Answer.create(answer_text: "22")
incorrectanswer5b = Answer.create(answer_text: "25")
incorrectanswer5c = Answer.create(answer_text: "28")

correctanswer6 = Answer.create(answer_text: "Europe")
incorrectanswer6 = Answer.create(answer_text: "Africa")
incorrectanswer6b = Answer.create(answer_text: "Asia")
incorrectanswer6c = Answer.create(answer_text: "North America")

qa1 = Qa.create(question_id: question1.id, answer_id: correctanswer1.id,  correct: true)

qa1b = Qa.create(question_id: question1.id, answer_id: incorrectanswer1.id, correct: false)

qa1c = Qa.create(question_id: question1.id, answer_id: incorrectanswer1b.id, correct: false)

qa1d = Qa.create(question_id: question1.id, answer_id: incorrectanswer1c.id, correct: false)

qa2 = Qa.create(question_id: question2.id, answer_id: correctanswer2.id,  correct: true)

qa2b = Qa.create(question_id: question2.id, answer_id: incorrectanswer2.id, correct: false)

qa2c = Qa.create(question_id: question2.id, answer_id: incorrectanswer2b.id, correct: false)

qa2d = Qa.create(question_id: question2.id, answer_id: incorrectanswer2c.id, correct: false)

qa3 = Qa.create(question_id: question3.id, answer_id: correctanswer3.id,  correct: true)

qa3b = Qa.create(question_id: question3.id, answer_id: incorrectanswer3.id, correct: false)

qa3c = Qa.create(question_id: question3.id, answer_id: incorrectanswer3b.id, correct: false)

qa3d = Qa.create(question_id: question3.id, answer_id: incorrectanswer3c.id, correct: false)

qa4 = Qa.create(question_id: question4.id, answer_id: correctanswer4.id,  correct: true)

qa4b = Qa.create(question_id: question4.id, answer_id: incorrectanswer4.id, correct: false)

qa4c = Qa.create(question_id: question4.id, answer_id: incorrectanswer4b.id, correct: false)

qa4d = Qa.create(question_id: question4.id, answer_id: incorrectanswer4c.id, correct: false)

qa5 = Qa.create(question_id: question5.id, answer_id: correctanswer5.id,  correct: true)

qa5b = Qa.create(question_id: question5.id, answer_id: incorrectanswer5.id, correct: false)

qa5c = Qa.create(question_id: question5.id, answer_id: incorrectanswer5b.id, correct: false)

qa5d = Qa.create(question_id: question5.id, answer_id: incorrectanswer5c.id, correct: false)

qa6 = Qa.create(question_id: question6.id, answer_id: correctanswer6.id,  correct: true)

qa6b = Qa.create(question_id: question6.id, answer_id: incorrectanswer6.id, correct: false)

qa6c = Qa.create(question_id: question6.id, answer_id: incorrectanswer6b.id, correct: false)

qa6d = Qa.create(question_id: question6.id, answer_id: incorrectanswer6c.id, correct: false)






# # 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
# ## a. by passing an array of hashes:







# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}






# # 3. Use Faker and mass create
# ## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


puts "🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱 "