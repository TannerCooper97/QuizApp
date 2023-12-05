class PagesController < ApplicationController
  def home
  end

  def question_types
    if params[:type]
      @questions = Question.where(question_type: params[:type])
    end
  end

end
