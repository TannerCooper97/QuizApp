class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :new, :create, :edit, :update, :destroy]

  # GET /options or /options.json
  def index
    @question = Question.find(params[:question_id])
    @options = @question.options
  end

  # GET /options/1 or /options/1.json
  def show
    @option = @question.options.find(params[:id])
  end

  # GET /options/new

  def new
    @option = @question.options.build
  end

  # GET /options/1/edit
  def edit
    @question = Question.find(params[:question_id])
    @option = @question.options.find(params[:id])
  end

  # POST /options or /options.json
  def create
    @option = Option.new(option_params)
    @option.question_id = params[:question_id]
  
    respond_to do |format|
      if @option.save
        format.html { redirect_to @question, notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1 or /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @question, notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1 or /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end
  
    def set_question
      @question = Question.find(params[:question_id])
    end

    # Only allow a list of trusted parameters through.
    def option_params
      params.require(:option).permit(:description, :question_id, :part1, :part2)
    end
end
