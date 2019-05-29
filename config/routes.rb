Rails.application.routes.draw do
  root to: 'shows#index', as: :json

  resources :aggregators

  get '/add_feed;', to: 'aggregators#engress'
  get 'index',      to: 'api/v1/episodes#index'
  get 'show',       to: 'api/v1/episodes#show'
  get 'index',      to: 'api/v1/shows#index'
  get 'show',       to: 'api/v1/shows#show'
  get 'guests',     to: 'api/v1/people#guests'
  get 'hosts',      to: 'api/v1/people#hosts'
  get 'guest',      to: 'api/v1/people#guest'
  get 'host;',      to: 'api/v1/people#host' 

  # namespace :aggregation,
  #   defaults: { format: 'json' },
  #   contraints: { subdomain: 'aggregator' } do

  #   namespace :v1 do
  #     resources :aggregators
  #     get '/add', to: 'aggregators#engress'
  #   end

  # end

  namespace :content,
    defaults: { format: 'json' },
    constraints: { subdomain: 'content' } do
    namespace :v1, path: '/' do
      resources :networks
      resources :shows do
        resources :episodes do
          resources :assets
          resources :media
        end
        resources :assets
      end
    end
  end

  namespace :user,
    defaults: { format: 'json' },
    constraints: { subdomain: 'user' } do

    namespace :v1, path: '/' do
      resources :users do
        resources :playstate
        resources :lists
      end
    end
  end
end
