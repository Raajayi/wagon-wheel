# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'
require "open-uri"

puts "Destroying db records"

puts "Destroying game sessions"
GameSession.destroy_all
puts "Destroying responses"
Response.destroy_all
puts "Destroying answers"
Answer.destroy_all
puts "Destroying questions"
Question.destroy_all
puts "Destroying games"
Game.destroy_all
puts "Destroying users"
User.destroy_all

puts "Seeding users"

puts "Seeding christina"
user1 = User.new(first_name: 'Christina', 
  last_name: 'Sugiono', 
  email: 'christina@gmail.com', 
  password: "123123"
)
file1 = URI.open("app/assets/images/christina-body.png")
user1.full_body.attach(io: file1, filename: "christina-body.png", content_type: "image/png")
file2 = URI.open("app/assets/images/christina-head.png")
user1.headshot.attach(io: file2, filename: "christina-headshot.png", content_type: "image/png")
user1.save!

puts "Seeding michele"
user2 = User.new(first_name: 'Michele', 
  last_name: 'Comolli', 
  email: 'michele@gmail.com', 
  password: "123123"
)
file1 = URI.open("app/assets/images/michele-body.png")
user2.full_body.attach(io: file1, filename: "michele-body.png", content_type: "image/png")
file2 = URI.open("app/assets/images/michele-head.png")
user2.headshot.attach(io: file2, filename: "michele-headshot.png", content_type: "image/png")
user2.save!

puts "Seeding millie"
user3 = User.new(first_name: 'Millie', 
  last_name: 'Pratley', 
  email: 'millie@gmail.com', 
  password: "123123"
)
file1 = URI.open("app/assets/images/millie-body.png")
user3.full_body.attach(io: file1, filename: "millie-body.png", content_type: "image/png")
file2 = URI.open("app/assets/images/millie-head.png")
user3.headshot.attach(io: file2, filename: "millie-headshot.png", content_type: "image/png")
user3.save!

puts "Seeding kim"
user4 = User.new(first_name: 'Kimberly', 
  last_name: 'Wong', 
  email: 'kim@gmail.com', 
  password: "123123"
)
file1 = URI.open("app/assets/images/kim-body.png")
user4.full_body.attach(io: file1, filename: "kim-body.png", content_type: "image/png")
file2 = URI.open("app/assets/images/kim-head.png")
user4.headshot.attach(io: file2, filename: "kim-headshot.png", content_type: "image/png")
user4.save!

puts "Seeding indy"
user5 = User.new(first_name: 'Indy', 
  last_name: 'Mandira', 
  email: 'indy@gmail.com', 
  password: "123123"
)
file1 = URI.open("app/assets/images/indy-fullbody.png")
user5.full_body.attach(io: file1, filename: "indy-fullbody.png", content_type: "image/png")
file2 = URI.open("app/assets/images/indy-head.png")
user5.headshot.attach(io: file2, filename: "indy-headshot.png", content_type: "image/png")
user5.save!

puts "Seeding ademide"
user6 = User.new(first_name: 'Ademide', 
  last_name: 'Ajayi', 
  email: 'ademide@gmail.com', 
  password: "123123"
)
file1 = URI.open("app/assets/images/ademide-full-body.png")
user6.full_body.attach(io: file1, filename: "ademide-body.png", content_type: "image/png")
file2 = URI.open("app/assets/images/ademide-head.png")
user6.headshot.attach(io: file2, filename: "ademide-headshot.png", content_type: "image/png")
user6.save!

puts "Seeding phil (admin)"
user7 = User.create!(first_name: 'Phillip', last_name: 'Peet', email: 'phillip@gmail.com', password: "123123")
# file1 = URI.open("app/assets/images/ademide-full-body.png")
# user7.full_body.attach(io: file1, filename: "ademide-full-body.png", content_type: "image/png")
# file2 = URI.open("app/assets/images/ademide-head.png")
# user7.headshot.attach(io: file2, filename: "ademide-headshot.png", content_type: "image/png")
# user7.save!

puts "Seeding Ruby quiz"

ruby = Game.create!(title: "Programming Basics", topic: "Ruby")
Game.create!(title: "Flows and arrays", topic: "Ruby")
Game.create!(title: "Iterators and blocks", topic: "Ruby")
Game.create!(title: "Hash and symbols", topic: "Ruby")

ruby_1 = Question.create!(content: "What does (1..5).to_a return?", game: ruby, order: 1)
ruby_2 = Question.create!(content: "What is the opposite of the while loop?", game: ruby, order: 2)
ruby_3 = Question.create!(content: "How do you write a conditional statement using the ternary operator?", game: ruby, order: 3)

ruby_1_a = Answer.create!(content: "1..5", correct: false, question: ruby_1)
ruby_1_b = Answer.create!(content: "1,2,3,4,5", correct: false, question: ruby_1)
ruby_1_c = Answer.create!(content: "[1,2,3,4,5]", correct: true, question: ruby_1)
ruby_1_d = Answer.create!(content: "(1,2,3,4,5)", correct: false, question: ruby_1)

ruby_2_a = Answer.create!(content: "for", correct: false, question: ruby_2)
ruby_2_b = Answer.create!(content: "until", correct: true, question: ruby_2)
ruby_2_c = Answer.create!(content: "map", correct: false, question: ruby_2)
ruby_2_d = Answer.create!(content: "each", correct: false, question: ruby_2)

ruby_3_a = Answer.create!(content: "condition ? code_when_truthy : code_when_falsy", correct: true, question: ruby_3)
ruby_3_b = Answer.create!(content: "condition = code_when_truthy : code_when_falsy", correct: false, question: ruby_3)
ruby_3_c = Answer.create!(content: "condition ? code_when_truthy | code_when_falsy", correct: false, question: ruby_3)
ruby_3_d = Answer.create!(content: "condition = code_when_truthy | code_when_falsy", correct: false, question: ruby_3)

puts "============================================================================================="
puts "Seeding OOP quiz"

oop = Game.create!(title: "Basic OOP", topic: "OOP")
Game.create!(title: "Advanced OOP", topic: "OOP")

oop_1 = Question.create!(content: "In a Controller, what are the instance methods reffered as?", game: oop, order: 1)
oop_2 = Question.create!(content: "Why do we use private within a class?", game: oop, order: 2)
oop_3 = Question.create!(content: "What does the super keyword do?", game: oop, order: 3)

oop_1_a = Answer.create!(content: "actions", correct: true, question: oop_1)
oop_1_b = Answer.create!(content: "instances", correct: false, question: oop_1)
oop_1_c = Answer.create!(content: "variables", correct: false, question: oop_1)
oop_1_d = Answer.create!(content: "methods", correct: false, question: oop_1)

oop_2_a = Answer.create!(content: "The private keyword enables access to methods from any part of the program.", correct: false, question: oop_2)
oop_2_b = Answer.create!(content: "Private methods provide enhanced performance and execute faster than public methods.", correct: false, question: oop_2)
oop_2_c = Answer.create!(content: "To separate public methods and private methods that can only be called between within the class.", correct: true, question: oop_2)
oop_2_d = Answer.create!(content: "Using private methods allows for easier integration with external libraries and APIs.", correct: false, question: oop_2)

oop_3_a = Answer.create!(content: "The super keyword creates a new instance of the parent class.", correct: false, question: oop_3)
oop_3_b = Answer.create!(content: "Super is used to invoke static methods of the current class.", correct: false, question: oop_3)
oop_3_c = Answer.create!(content: "Using super allows access to private methods of the subclass.", correct: false, question: oop_3)
oop_3_d = Answer.create!(content: "Super calls the parent's method which has the same name.", correct: true, question: oop_3)

puts "============================================================================================="
puts "Seeding html quiz"

Game.create!(title: "Bootstrap, grids and layouts", topic: "FEWD")
html = Game.create!(title: "HTML & CSS", topic: "FEWD")

html_1 = Question.create!(content: "What is a CSS id and why is it useful?", game: html, order: 1)
html_2 = Question.create!(content: "How do you emphasize a word in a paragraph?", game: html, order: 2)
html_3 = Question.create!(content: "What are the three languages your browser speaks?", game: html, order: 3)

html_1_a = Answer.create!(content: "A CSS id is a way to group multiple elements together and apply styles collectively.", correct: false, question: html_1)
html_1_b = Answer.create!(content: "A CSS id is a special class that can only be used for inline styling.", correct: false, question: html_1)
html_1_c = Answer.create!(content: "A CSS id is an HTML attribute used to define some CSS properties for a unique element", correct: true, question: html_1)
html_1_d = Answer.create!(content: "A CSS id is used to create animations and transitions on web pages.", correct: false, question: html_1)

html_2_a = Answer.create!(content: "<bold>", correct: false, question: html_2)
html_2_b = Answer.create!(content: "<highlight>", correct: false, question: html_2)
html_2_c = Answer.create!(content: "<italicize>", correct: false, question: html_2)
html_2_d = Answer.create!(content: "<strong>", correct: true, question: html_2)

html_3_a = Answer.create!(content: "HTML, CSS & JavaScript", correct: true, question: html_3)
html_3_b = Answer.create!(content: "Java, C++, Python", correct: false, question: html_3)
html_3_c = Answer.create!(content: "Ruby, PHP, Swift", correct: false, question: html_3)
html_3_d = Answer.create!(content: "XML, JSON, SQL", correct: false, question: html_3)

puts "Seeding responses"
puts "User 1's response"

response = Response.new(answer: ruby_1_a, question: ruby_1_a.question, user: user1)
response.eval_score
response.save!

response = Response.new(answer: ruby_2_c, question: ruby_2_c.question, user: user1)
response.eval_score
response.save!
response = Response.new(answer: ruby_3_b, question: ruby_3_b.question, user: user1)
response.eval_score
response.save!

response = Response.new(answer: oop_1_b, question: oop_1_b.question, user: user1)
response.eval_score
response.save!
response = Response.new(answer: oop_2_a, question: oop_2_a.question, user: user1)
response.eval_score
response.save!
response = Response.new(answer: oop_3_c, question: oop_3_c.question, user: user1)
response.eval_score
response.save!

response = Response.new(answer: html_1_d, question: html_1_d.question, user: user1)
response.eval_score
response.save!
response = Response.new(answer: html_2_a, question: html_2_a.question, user: user1)
response.eval_score
response.save!
response = Response.new(answer: html_3_b, question: html_3_b.question, user: user1)
response.eval_score
response.save!

puts "User 2's response"

response = Response.new(answer: ruby_1_d, question: ruby_1_d.question, user: user2)
response.eval_score
response.save!
response = Response.new(answer: ruby_2_a, question: ruby_2_a.question, user: user2)
response.eval_score
response.save!
response = Response.new(answer: ruby_3_c, question: ruby_3_c.question, user: user2)
response.eval_score
response.save!

response = Response.new(answer: oop_1_a, question: oop_1_a.question, user: user2)
response.eval_score
response.save!
response = Response.new(answer: oop_2_a, question: oop_2_a.question, user: user2)
response.eval_score
response.save!
response = Response.new(answer: oop_3_b, question: oop_3_b.question, user: user2)
response.eval_score
response.save!

response = Response.new(answer: html_1_c, question: html_1_d.question, user: user2)
response.eval_score
response.save!
response = Response.new(answer: html_2_b, question: html_2_b.question, user: user2)
response.eval_score
response.save!
response = Response.new(answer: html_3_a, question: html_3_b.question, user: user2)
response.eval_score
response.save!

puts "User 3's responses"

response = Response.new(answer: ruby_1_c, question: ruby_1_c.question, user: user3)
response.eval_score
response.save!
response = Response.new(answer: ruby_2_a, question: ruby_2_a.question, user: user3)
response.eval_score
response.save!
response = Response.new(answer: ruby_3_d, question: ruby_3_d.question, user: user3)
response.eval_score
response.save!

response = Response.new(answer: oop_1_d, question: oop_1_d.question, user: user3)
response.eval_score
response.save!
response = Response.new(answer: oop_2_c, question: oop_2_c.question, user: user3)
response.eval_score
response.save!
response = Response.new(answer: oop_3_a, question: oop_3_a.question, user: user3)
response.eval_score
response.save!

response = Response.new(answer: html_1_c, question: html_1_b.question, user: user3)
response.eval_score
response.save!
response = Response.new(answer: html_2_d, question: html_2_a.question, user: user3)
response.eval_score
response.save!
response = Response.new(answer: html_3_b, question: html_3_b.question, user: user3)
response.eval_score
response.save!

puts "User 4's responses"

response = Response.new(answer: ruby_1_b, question: ruby_1_b.question, user: user4)
response.eval_score
response.save!
response = Response.new(answer: ruby_2_a, question: ruby_2_a.question, user: user4)
response.eval_score
response.save!
response = Response.new(answer: ruby_3_d, question: ruby_3_d.question, user: user4)
response.eval_score
response.save!

response = Response.new(answer: oop_1_c, question: oop_1_c.question, user: user4)
response.eval_score
response.save!
response = Response.new(answer: oop_2_d, question: oop_2_d.question, user: user4)
response.eval_score
response.save!
response = Response.new(answer: oop_3_c, question: oop_3_c.question, user: user4)
response.eval_score
response.save!

response = Response.new(answer: html_1_a, question: html_1_a.question, user: user4)
response.eval_score
response.save!
response = Response.new(answer: html_2_b, question: html_2_b.question, user: user4)
response.eval_score
response.save!
response = Response.new(answer: html_3_c, question: html_3_c.question, user: user4)
response.eval_score
response.save!

puts "Seeding complete!"
