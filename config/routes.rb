Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :universal_resource_identifier, only: [:create]
  resources :universal_resource_identifier, path: 'uri', only: [:show], defaults: {format: 'json'}, constraints: lambda {|req| req.format == :json}

  get '/s/:short_url_id', to: 'universal_resource_identifier#visit', as: :visit_shortened, constraints: {id: /[A-Za-z0-9]\d{6}/}
end
