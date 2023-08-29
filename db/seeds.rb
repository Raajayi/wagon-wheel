# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying db records"

Answer.destroy_all
Question.destroy_all
Game.destroy_all

puts "Started seeding"

puts "Seeding Ruby quiz"

ruby = Game.create!(topic: "Ruby")

ruby_1 = Question.create!(content: "What does (1..5).to_a return?", game: ruby, order: 1)
ruby_2 = Question.create!(content: "What is the opposite of the while loop?", game: ruby, order: 2)
ruby_3 = Question.create!(content: "How do you write a conditional statement using the ternary operator?", game: ruby, order: 3)

Answer.create!(content: "1..5", correct: false, question: ruby_1)
Answer.create!(content: "1,2,3,4,5", correct: false, question: ruby_1)
Answer.create!(content: "[1,2,3,4,5]", correct: true, question: ruby_1)
Answer.create!(content: "(1,2,3,4,5)", correct: false, question: ruby_1)

Answer.create!(content: "for", correct: false, question: ruby_2)
Answer.create!(content: "until", correct: true, question: ruby_2)
Answer.create!(content: "map", correct: false, question: ruby_2)
Answer.create!(content: "each", correct: false, question: ruby_2)

Answer.create!(content: "condition ? code_when_truthy : code_when_falsy", correct: true, question: ruby_3)
Answer.create!(content: "condition = code_when_truthy : code_when_falsy", correct: false, question: ruby_3)
Answer.create!(content: "condition ? code_when_truthy | code_when_falsy", correct: false, question: ruby_3)
Answer.create!(content: "condition = code_when_truthy | code_when_falsy", correct: false, question: ruby_3)

puts "============================================================================================="
puts "Seeding OOP quiz"

oop = Game.create!(topic: "OOP")

oop_1 = Question.create!(content: "In a Controller, what are the instance methods reffered as?", game: oop, order: 1)
oop_2 = Question.create!(content: "Why do we use private within a class?", game: oop, order: 2)
oop_3 = Question.create!(content: "What does the super keyword do?", game: oop, order: 3)

Answer.create!(content: "actions", correct: true, question: oop_1)
Answer.create!(content: "instances", correct: false, question: oop_1)
Answer.create!(content: "variables", correct: false, question: oop_1)
Answer.create!(content: "methods", correct: false, question: oop_1)

Answer.create!(content: "The private keyword enables access to methods from any part of the program.", correct: false, question: oop_2)
Answer.create!(content: "Private methods provide enhanced performance and execute faster than public methods.", correct: false, question: oop_2)
Answer.create!(content: "To separate public methods and private methods that can only be called between within the class.", correct: true, question: oop_2)
Answer.create!(content: "Using private methods allows for easier integration with external libraries and APIs.", correct: false, question: oop_2)

Answer.create!(content: "The super keyword creates a new instance of the parent class.", correct: false, question: oop_3)
Answer.create!(content: "Super is used to invoke static methods of the current class.", correct: false, question: oop_3)
Answer.create!(content: "Using super allows access to private methods of the subclass.", correct: false, question: oop_3)
Answer.create!(content: "Super calls the parent's method which has the same name.", correct: true, question: oop_3)

puts "============================================================================================="
puts "Seeding html quiz"

html = Game.create!(topic: "HTML & CSS")

html_1 = Question.create!(content: "What is a CSS id and why is it useful?", game: html, order: 1)
html_2 = Question.create!(content: "How do you emphasize a word in a paragraph?", game: html, order: 2)
html_3 = Question.create!(content: "What are the three languages your browser speaks?", game: html, order: 3)

Answer.create!(content: "A CSS id is a way to group multiple elements together and apply styles collectively.", correct: false, question: html_1)
Answer.create!(content: "A CSS id is a special class that can only be used for inline styling.", correct: false, question: html_1)
Answer.create!(content: "A CSS id is an HTML attribute used to define some CSS properties for a unique element", correct: true, question: html_1)
Answer.create!(content: "A CSS id is used to create animations and transitions on web pages.", correct: false, question: html_1)

Answer.create!(content: "<bold>", correct: false, question: html_2)
Answer.create!(content: "<highlight>", correct: false, question: html_2)
Answer.create!(content: "<italicize>", correct: false, question: html_2)
Answer.create!(content: "<strong>", correct: true, question: html_2)

Answer.create!(content: "HTML, CSS & JavaScript", correct: true, question: html_3)
Answer.create!(content: "Java, C++, Python", correct: false, question: html_3)
Answer.create!(content: "Ruby, PHP, Swift", correct: false, question: html_3)
Answer.create!(content: "XML, JSON, SQL", correct: false, question: html_3)

puts "Seeding complete!"