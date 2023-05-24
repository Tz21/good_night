Rails.application.routes.draw do
  resources :users do
    resources :sleep_records, only: [:create]

    member do
      post :follow
      delete :unfollow
    end

    get :friends_sleep_records, on: :member
  end
end
