class QuestionsController < ApplicationController
  def index
    @current_user = current_user
    if params[:search] != nil
      search_key = "%#{params[:search]}%"
      @questions = Question.where('name LIKE ? OR description LIKE ?', search_key, search_key)
    else
      @questions = Question.all
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question), notice: "La pregunta fue publicada exitosamente"
    else
      render :new
    end
  end

  private
    def question_params
      params.require(:question).permit(:name, :description)
    end
end
