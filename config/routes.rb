# == Route Map
#
#                            Prefix Verb   URI Pattern                            Controller#Action
#                  new_user_session GET    /users/sign_in(.:format)               devise/sessions#new
#                      user_session POST   /users/sign_in(.:format)               devise/sessions#create
#              destroy_user_session DELETE /users/sign_out(.:format)              devise/sessions#destroy
#                 new_user_password GET    /users/password/new(.:format)          devise/passwords#new
#                edit_user_password GET    /users/password/edit(.:format)         devise/passwords#edit
#                     user_password PATCH  /users/password(.:format)              devise/passwords#update
#                                   PUT    /users/password(.:format)              devise/passwords#update
#                                   POST   /users/password(.:format)              devise/passwords#create
#          cancel_user_registration GET    /users/cancel(.:format)                devise/registrations#cancel
#             new_user_registration GET    /users/sign_up(.:format)               devise/registrations#new
#            edit_user_registration GET    /users/edit(.:format)                  devise/registrations#edit
#                 user_registration PATCH  /users(.:format)                       devise/registrations#update
#                                   PUT    /users(.:format)                       devise/registrations#update
#                                   DELETE /users(.:format)                       devise/registrations#destroy
#                                   POST   /users(.:format)                       devise/registrations#create
#                          supplies GET    /supplies(.:format)                    supplies#index
#                                   POST   /supplies(.:format)                    supplies#create
#                        new_supply GET    /supplies/new(.:format)                supplies#new
#                       edit_supply GET    /supplies/:id/edit(.:format)           supplies#edit
#                            supply GET    /supplies/:id(.:format)                supplies#show
#                                   PATCH  /supplies/:id(.:format)                supplies#update
#                                   PUT    /supplies/:id(.:format)                supplies#update
#                                   DELETE /supplies/:id(.:format)                supplies#destroy
#                              root GET    /                                      supplies#index
#  turbo_recede_historical_location GET    /recede_historical_location(.:format)  turbo/native/navigation#recede
#  turbo_resume_historical_location GET    /resume_historical_location(.:format)  turbo/native/navigation#resume
# turbo_refresh_historical_location GET    /refresh_historical_location(.:format) turbo/native/navigation#refresh

Rails.application.routes.draw do
  devise_for :users
  resources :supplies

  root to: "supplies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
