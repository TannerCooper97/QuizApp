class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :desc
      t.string :question_type

      t.timestamps
    end
  end
end
