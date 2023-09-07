class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    # sleep(5) if (current_user == User.find_by_email('phillip@gmail.com') && @question.order == 1)
    # sleep(1)

    @game = @question.game
    @question_count = @question.game.questions.count
    @response = Response.new
    @correct_answer_id = @question.correct_answer.first.id

    # @game_session = GameSession.find_by(game: @question.game)
    @users = @game.users

    @old_order = @game.played_users.sort_by do |user|
        -user.old_game_score(@game)
    end

    @new_order = @game.played_users.sort_by do |user|
      -user.game_score(@game)
    end

    # @users = @game_session.current_users
    # @users = User.leaderboard_ranked

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
