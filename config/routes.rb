# == Route Map
#
#                            Prefix Verb URI Pattern                            Controller#Action
#  turbo_recede_historical_location GET  /recede_historical_location(.:format)  turbo/native/navigation#recede
#  turbo_resume_historical_location GET  /resume_historical_location(.:format)  turbo/native/navigation#resume
# turbo_refresh_historical_location GET  /refresh_historical_location(.:format) turbo/native/navigation#refresh

Rails.application.routes.draw do
  resources :supplies

  root to: "supplies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
