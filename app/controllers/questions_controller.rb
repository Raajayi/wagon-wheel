class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question_count = @question.game.questions.count
    @response = Response.new
    @correct_answer = @question.correct_answer
  end
end
