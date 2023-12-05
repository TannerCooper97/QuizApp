class AddQuestionTypeToQuizQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :quiz_questions, :question_type, :string
  end
end
