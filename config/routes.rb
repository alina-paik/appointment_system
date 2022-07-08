# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations"
             }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
