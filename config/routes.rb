Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        get '/tags/:entity_type/:entity_id', to: 'tags#show'
        delete '/tags/:entity_type/:entity_id', to: 'tags#delete'
        resources :tag
        get '/stats/:entity_type/:entity_id', to: 'stats#show'
        resources :stats
      end
    end
end
