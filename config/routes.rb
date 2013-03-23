Nyhrc::Application.routes.draw do
  root to: "schedule#index"
  get "/:day", to: "schedule#index", as: "schedule"
end
