class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question_count = @question.game.questions.count
    @response = Response.new
  end
end
