class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question_count = @question.game.questions.count
    @response = Response.new
    @correct_answer_id = @question.correct_answer.first.id

    # @ladder

    @users = User.leaderboard_ranked

  end
end
