class QuestionsController < ActionController::Base
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  def new

  end
end
