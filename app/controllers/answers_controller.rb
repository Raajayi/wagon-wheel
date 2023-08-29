class AnswersController < ApplicationController
  def show
    # @answer = Answer.all
    @answer = Answer.find(params[:id])
  end
end
