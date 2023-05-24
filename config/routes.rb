Rails.application.routes.draw do
  resources :users do
    resources :sleep_records, only: [:create]
  end
end
