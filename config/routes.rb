Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'post#index'
  match 'endpoint/:key', to: 'post#endpoint', via: [:get]
  match 'endpoint/:key', to: 'post#broadcast', via: [:post, :put, :delete]
end
