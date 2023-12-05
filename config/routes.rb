Rails.application.routes.draw do
  get 'quizzes/pre_new', to: 'quizzes#pre_new', as: :pre_new_quiz
  get '/question_types', to: 'pages#question_types'

  resources :quizzes do
    resources :quiz_questions
  end

  resources :questions do
    resources :options
  end

  root "pages#home"
end