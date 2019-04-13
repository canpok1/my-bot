Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, format: 'json' do
    namespace :v1 do
      post "slack/event", to: "slack#receive_event_api"
    end
  end
end
