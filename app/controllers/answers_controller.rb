class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)

    if @answer.errors.any?
      render 'questions/show'
    else
      redirect_to @question
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:content).merge(user: current_user)
    end
end
