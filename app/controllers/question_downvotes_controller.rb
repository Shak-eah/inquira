class QuestionDownvotesController < ApplicationController
  before_action :set_question_downvote, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @question_downvotes = QuestionDownvote.all
    respond_with(@question_downvotes)
  end

  def show
    respond_with(@question_downvote)
  end

  def new
    @question_downvote = QuestionDownvote.new
    respond_with(@question_downvote)
  end

  def edit
  end

  def create
    @question_downvote = QuestionDownvote.new(question_downvote_params)
    #Needs to be current user
    @question_downvote.user_id = 1;
    @question_downvote.save
    # respond_with(@question_downvote)
    respond_with(@question_downvote) do |format|
      format.html
      format.json {render json: @question_downvote}
    end
  end

  def update
    @question_downvote.update(question_downvote_params)
    respond_with(@question_downvote)
  end

  def destroy
    @question_downvote.destroy
    respond_with(@question_downvote)
  end

  private
    def set_question_downvote
      @question_downvote = QuestionDownvote.find(params[:id])
    end

    def question_downvote_params
      params[:question_downvote]
      params.require(:question_downvote).permit(:question_id,:user_id)
    end
end
