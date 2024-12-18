Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  root "recipes#index"

  # Optional routes for health check and PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
