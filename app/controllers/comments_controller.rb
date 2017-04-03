class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment_q = @question.comments.create(comment_params)

    if @comment_q.errors.any?
      render 'questions/show'
    else
      redirect_to @question
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user: current_user)
    end
end
