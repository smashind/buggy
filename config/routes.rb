Rails.application.routes.draw do
  root to: "application#index"
  resources :projects
  resources :issues
end
