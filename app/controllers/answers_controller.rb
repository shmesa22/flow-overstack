class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(@answer.question_id)

    @answer.save

    if @answer.errors.any?
      render 'questions/show'
    else
      redirect_to @question, notice: "Tu respuesta fue publicada exitosamente"
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :question_id).merge(user: current_user)
    end
end
