# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations"
             }
   get 'users/profile', to: 'users#profile'

   resources :specialist_services 
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
