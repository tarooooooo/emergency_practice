class Admin::QuestionsController < ApplicationController
  def index
    p "current_admin: #{current_admin}"
    @questions = Question.order(id: :desc)
  end

  def create
    @question = current_admin.questions.new(questions_params)

    if @question.save
      redirect_to admin_questions_path, notice: '質問を投稿しました'
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to admin_questions_path, notice: '質問を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path, notice: '質問を削除しました'
  end

  private

  def questions_params
    params.require(:question).permit(:title, :content)
  end
end

