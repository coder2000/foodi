# == Route Map
#
#                                Prefix Verb     URI Pattern                                  Controller#Action
#                      new_user_session GET      /users/sign_in(.:format)                     users/sessions#new
#                          user_session POST     /users/sign_in(.:format)                     users/sessions#create
#                  destroy_user_session DELETE   /users/sign_out(.:format)                    users/sessions#destroy
# user_google_oauth2_omniauth_authorize GET|POST /users/auth/google_oauth2(.:format)          users/omniauth_callbacks#passthru
#  user_google_oauth2_omniauth_callback GET|POST /users/auth/google_oauth2/callback(.:format) users/omniauth_callbacks#google_oauth2
#      user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)               users/omniauth_callbacks#passthru
#       user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)      users/omniauth_callbacks#facebook
#       user_twitter_omniauth_authorize GET|POST /users/auth/twitter(.:format)                users/omniauth_callbacks#passthru
#        user_twitter_omniauth_callback GET|POST /users/auth/twitter/callback(.:format)       users/omniauth_callbacks#twitter
#                     new_user_password GET      /users/password/new(.:format)                devise/passwords#new
#                    edit_user_password GET      /users/password/edit(.:format)               devise/passwords#edit
#                         user_password PATCH    /users/password(.:format)                    devise/passwords#update
#                                       PUT      /users/password(.:format)                    devise/passwords#update
#                                       POST     /users/password(.:format)                    devise/passwords#create
#              cancel_user_registration GET      /users/cancel(.:format)                      devise/registrations#cancel
#                 new_user_registration GET      /users/sign_up(.:format)                     devise/registrations#new
#                edit_user_registration GET      /users/edit(.:format)                        devise/registrations#edit
#                     user_registration PATCH    /users(.:format)                             devise/registrations#update
#                                       PUT      /users(.:format)                             devise/registrations#update
#                                       DELETE   /users(.:format)                             devise/registrations#destroy
#                                       POST     /users(.:format)                             devise/registrations#create
#                 new_user_confirmation GET      /users/confirmation/new(.:format)            devise/confirmations#new
#                     user_confirmation GET      /users/confirmation(.:format)                devise/confirmations#show
#                                       POST     /users/confirmation(.:format)                devise/confirmations#create
#                       new_user_unlock GET      /users/unlock/new(.:format)                  devise/unlocks#new
#                           user_unlock GET      /users/unlock(.:format)                      devise/unlocks#show
#                                       POST     /users/unlock(.:format)                      devise/unlocks#create
#                                  user GET      /users/:id(.:format)                         users#show
#                              supplies GET      /supplies(.:format)                          supplies#index
#                                       POST     /supplies(.:format)                          supplies#create
#                            new_supply GET      /supplies/new(.:format)                      supplies#new
#                           edit_supply GET      /supplies/:id/edit(.:format)                 supplies#edit
#                                supply GET      /supplies/:id(.:format)                      supplies#show
#                                       PATCH    /supplies/:id(.:format)                      supplies#update
#                                       PUT      /supplies/:id(.:format)                      supplies#update
#                                       DELETE   /supplies/:id(.:format)                      supplies#destroy
#                            households GET      /households(.:format)                        households#index
#                                       POST     /households(.:format)                        households#create
#                         new_household GET      /households/new(.:format)                    households#new
#                        edit_household GET      /households/:id/edit(.:format)               households#edit
#                             household GET      /households/:id(.:format)                    households#show
#                                       PATCH    /households/:id(.:format)                    households#update
#                                       PUT      /households/:id(.:format)                    households#update
#                                       DELETE   /households/:id(.:format)                    households#destroy
#                    authenticated_root GET      /                                            dashboard#index
#                                  root GET      /                                            static#index
#      turbo_recede_historical_location GET      /recede_historical_location(.:format)        turbo/native/navigation#recede
#      turbo_resume_historical_location GET      /resume_historical_location(.:format)        turbo/native/navigation#resume
#     turbo_refresh_historical_location GET      /refresh_historical_location(.:format)       turbo/native/navigation#refresh

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:show]
  resources :supplies
  resources :households

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  root to: "static#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
