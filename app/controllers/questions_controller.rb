class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @response = Response.new
  end
end
