class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    @response.user = current_user
    @response.eval_score

    # if @response == @response.answer


    if @response.save
      current_question = @response.answer.question.order
      next_question = @response.answer.question.game.questions.find_by(order: current_question + 1)

      if next_question.nil?
        #  total score
        redirect_to score_game_path(@response.answer.question.game)
      else
        redirect_to question_path(next_question), notice: "Booking Created!"
      end

    #else
    # render 'questions/show', status: :unprocessable_entity, notice: "Could not create booking"

    end
  end

  def response_params
    params.require(:response).permit(:content, :answer_id)
  end

end
