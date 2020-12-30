# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items, except:[:destroy] do
  end
end
