Nyhrc::Application.routes.draw do
  root to: "schedule#index"

  namespace :api do
    get "schedule", to: "schedule#index"
  end
end
