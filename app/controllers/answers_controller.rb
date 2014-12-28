class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = @question.id
    if @answer.save
      redirect_to @question, notice: "Answer sucessfully created."
    else
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end
end
