Rails.application.routes.draw do
  get 'notifications/index'
  
  resources :notifications
  
  root 'notifications#index'
end
