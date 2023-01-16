# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :project_users, only: %i[index create destroy]
    resources :bugs, only: %i[new create edit update show destroy] do
      resources :user_bugs, only: %i[create update destroy]
    end
  end

  root to: "home#index"
end
