class CommentsController < ApplicationController
  def create
    if params[:question_id]
      commentable = Question.find(params[:question_id])
      @question = commentable
    elsif params[:answer_id]
      commentable = Answer.find(params[:answer_id])
      @question = Question.find(commentable.question_id)
    end

    @comment = commentable.comments.create(comment_params)

    if @comment.errors.any?
      render 'questions/show'
    else
      redirect_to @question, notice: "Tu comentario fue publicado exitosamente"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user: current_user)
    end
end
