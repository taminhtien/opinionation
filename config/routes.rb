Rails.application.routes.draw do
  resources :topics, only: [] do
    resources :opinions, only: [:new, :create]
  end

  get 'topics/opinions/thank-you' => 'opinions#thank_you', as: :thank_you_opinions
  get 'topics/opinions/clear-session' => 'opinions#clear_session', as: :clear_session_opinions
  root 'opinions#new'
end
