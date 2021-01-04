require 'pry'
User.destroy_all
Quiz.destroy_all
QuizDifficulty.destroy_all
Question.destroy_all
Qa.destroy_all
Difficulty.destroy_all
Answer.destroy_all
User.reset_pk_sequence
Quiz.reset_pk_sequence
QuizDifficulty.reset_pk_sequence
Question.reset_pk_sequence
Qa.reset_pk_sequence
Difficulty.reset_pk_sequence
Answer.reset_pk_sequence

########### different ways to write your seeds ############







# 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)
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

question1 = Question.create(question_text: "How many whatever?", difficulty_id: easy.id)
question2 = Question.create(question_text: "How manys whatever?", difficulty_id: easy.id)
question3 = Question.create(question_text: "How many whateversss?", difficulty_id: easy.id)

question4 = Question.create(question_text: "How many wherevers?", difficulty_id: normal.id)
question5 = Question.create(question_text: "How manys wherevers??", difficulty_id: normal.id)
question6 = Question.create(question_text: "How many whereversss??", difficulty_id: normal.id)

question7 = Question.create(question_text: "How many whenever?", difficulty_id: hard.id)
question8 = Question.create(question_text: "How manys whenever??", difficulty_id: hard.id)
question9 = Question.create(question_text: "How many wheneversss?", difficulty_id: hard.id)

correctanswer1 = Answer.create(answer_text: "for sure")
incorrectanswer1 = Answer.create(answer_text: "nah")
incorrectanswer1b = Answer.create(answer_text: "nope")
incorrectanswer1c = Answer.create(answer_text: "never")


correctanswer2 = Answer.create(answer_text: "100 percent")
incorrectanswer2 = Answer.create(answer_text: "none")
incorrectanswer2b = Answer.create(answer_text: "negative")
incorrectanswer2c = Answer.create(answer_text: "50 percent")

correctanswer3 = Answer.create(answer_text: "for sure")
incorrectanswer3 = Answer.create(answer_text: "nah")
incorrectanswer3b = Answer.create(answer_text: "nope")
incorrectanswer3c = Answer.create(answer_text: "never")

qa1 = Qa.create(question_id: question1.id, answer_id: correctanswer1.id, incorrect_answer_1_id: incorrectanswer1.id, incorrect_answer_2_id: incorrectanswer1b.id, incorrect_answer_3_id: incorrectanswer1c.id, correct: true)

qa2 = Qa.create(question_id: question2.id, answer_id: correctanswer2.id, incorrect_answer_1_id: incorrectanswer2.id, incorrect_answer_2_id: incorrectanswer2b.id, incorrect_answer_3_id: incorrectanswer2c.id, correct: true)

qa3 = Qa.create(question_id: question3.id, answer_id: correctanswer3.id, incorrect_answer_1_id: incorrectanswer3.id, incorrect_answer_2_id: incorrectanswer3b.id, incorrect_answer_3_id: incorrectanswer3c.id, correct: true)




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


puts "🔥 🔥 🔥 🔥 "