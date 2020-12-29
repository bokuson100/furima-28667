# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items, only: %i[index new create show edit update] do
  end
end
