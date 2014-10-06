CalendarExample::Application.routes.draw do
  resources :events
  resource :calendar, only: [:show], controller: :calendar
  root to: "calendar#show"
end
