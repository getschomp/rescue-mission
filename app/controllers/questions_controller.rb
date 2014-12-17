class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]

  def current_user_id
    User.first.id
  end

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    id = params[:id]
    @question = Question.find(id)
    @answer = Answer.all.order(created_at: :desc)
  end

  def edit
    @question = Question.find(params[:id])
    if current_user.id != @question.user_id
      redirect_to @question, notice: 'You did not create this question'
    end
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if  @question.save
      redirect_to @question, notice: 'question was sucessfully edited'
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end


  def new
    @question = Question.new
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
