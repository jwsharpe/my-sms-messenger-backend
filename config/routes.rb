Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      post "/twilio/webhook", to: "twilio#webhook"
      resources :messages, only: [:index, :create]
    end
  end
end
