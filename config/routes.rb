Rails.application.routes.draw do
  root to: 'shows#index', as: :json

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
