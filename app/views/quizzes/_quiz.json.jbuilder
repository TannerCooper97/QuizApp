json.extract! quiz, :id, :title, :is_survey, :desc, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
