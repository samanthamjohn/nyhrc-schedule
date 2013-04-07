Nyhrc::Application.routes.draw do
  root to: "schedule#index"

  namespace :api do
    get "schedule", to: "schedule#index"
    get "schedule/day/:weekday", to: "schedule#show"
  end
end
