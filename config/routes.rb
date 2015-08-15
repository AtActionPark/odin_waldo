Rails.application.routes.draw do
  root 'static_pages#home'
  get '/locations', to: 'static_pages#locations'
end
