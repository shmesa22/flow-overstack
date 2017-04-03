class VotesController < ApplicationController
  def create
    if params[:question_id]
      votable = Question.find(params[:question_id])
      @question = votable
    elsif params[:answer_id]
      votable = Answer.find(params[:answer_id])
      @question = Question.find(votable.question_id)
    end

    votable.votes.create(user: current_user)

    redirect_to @question 
  end

  def destroy
    if params[:question_id]
      votable = Question.find(params[:id])
      @question = votable
    elsif params[:answer_id]
      votable = Answer.find(params[:id])
      @question = Question.find(votable.question_id)
    end

    votable.votes.where(user: current_user).take.try(:destroy)

    redirect_to @question 
  end
end
