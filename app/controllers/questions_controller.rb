class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question_count = @question.game.questions.count
    @response = Response.new
    @correct_answer_id = @question.correct_answer.first.id
    
    # @ladder
    @users = User.leaderboard_ranked

    if current_user == User.find_by(email: "phillip@gmail.com")
      GameChannel.broadcast_to(
        @question.game,
        {
          message: "#{current_user.first_name} starts #{@question.game.title}",
          gameId: @question.game.id,
          questionId: @question.id,
          userId: current_user.id
        }
      )
    end
  end
end
