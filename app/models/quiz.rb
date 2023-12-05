class Quiz < ApplicationRecord
    has_many :quiz_questions, dependent: :destroy
    accepts_nested_attributes_for :quiz_questions
    has_many :questions, through: :quiz_questions
end
