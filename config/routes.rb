Rails.application.routes.draw do
  resources :quiz_questions
  resources :quizzes
  resources :questions do
    resources :options
  end
  root "pages#home"
end