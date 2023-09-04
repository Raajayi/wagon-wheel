class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question_count = Question.all.count
    @response = Response.new
  end
end
