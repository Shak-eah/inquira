class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    puts "in questions Controller index. "
    @questions = Question.all
    puts @questions

    respond_with(@questions) do |format|
      format.html
      format.json {render json: @questions}
    end

    # respond_with(@questions)
  end

  def show
    # respond_with(@question)
    respond_with(@question) do |format|
      format.html
      format.json {render json: @question}
    end

  end

  def new
    @question = Question.new
    # respond_with(@question)
    respond_with(@question) do |format|
      format.html
      format.json {render json: @question}
    end
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.save
    respond_with(@question) do |format|
      format.html
      format.json {render json: @question}
    end
    # respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question) do |format|
      format.html
      format.json {render json: @question}
    end
    # respond_with(@question)
  end

  def destroy
    @question.destroy
    # respond_with(@question)

    # This probably will need to be changed.
    respond_with(@question) do |format|
      format.html
      format.json {render json: @question}
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params[:question]
      params.require(:question).permit(:title, :description, :anonymous)
    end
end
