Rails.application.routes.draw do
  resources :quizzes do
    resources :quiz_questions
  end
  resources :questions do
    resources :options
  end
  root "pages#home"
end