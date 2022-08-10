# frozen_string_literal: true

Rails.application.routes.draw do
   devise_for :users,
              controllers: {
                sessions: "users/sessions",
                registrations: "users/registrations",
                # confirmations: "users/confirmations"
              }
   get "users/profile", to: "users#profile"
   patch "users/change_password", to: "users#update_password"

   get "client_appointments/pending", to: "client_appointments#index_pending"
   get "client_appointments/:id", to: "client_appointments#show"
   put "client_appointments/:id", to: "client_appointments#update"

   resources :services
   resources :categories
   resources :client_appointments
 end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
