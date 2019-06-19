Rails.application.routes.draw do
  get 'redis/index'

  resources :tasks
  root :to => 'tasks#index'

  resources :redis
  root :to => 'redis#index'

  namespace 'api' do
    namespace 'v1' do
      resources :posts
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
