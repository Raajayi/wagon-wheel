class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question_count = @question.game.questions.count
    @response = Response.new
    @correct_answer_id = @question.correct_answer.first.id

    @game_session = GameSession.find_by(game: @question.game, user: current_user)
    @users = @game_session.current_users

  end
end
