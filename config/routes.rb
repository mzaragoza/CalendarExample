CalendarExample::Application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => "users/sessions",
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }

  authenticate :user do
    namespace :users do
      resources :events
      resource :calendar, only: [:show], controller: :calendar
      root to: "calendar#show"
    end
  end

  match 'ping'         => 'pages#ping',           as: :ping, via: :all
  root 'pages#index'
end
