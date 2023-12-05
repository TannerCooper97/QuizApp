class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit update destroy ]

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
  end

  def pre_new
    @quiz = Quiz.new
  end

  # quizzes_controller.rb
  def new
    @quiz = Quiz.new(is_survey: params[:is_survey] == '1')
    params[:number_of_questions].to_i.times { @quiz.quiz_questions.build }
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: "Quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:title, :desc, :is_survey, quiz_questions_attributes: [:id, :question_id, :points])
    end
end
